create extension if not exists "http" with schema "public" version '1.5';

create table "public"."supascript_js_modules" (
    "module" text not null,
    "autoload" boolean default false,
    "source" text
);


alter table "public"."supascript_js_modules" enable row level security;

create table "public"."supascript_log" (
    "id" uuid not null default uuid_generate_v4(),
    "created" timestamp with time zone default CURRENT_TIMESTAMP,
    "_catalog" text default CURRENT_CATALOG,
    "_user" text default CURRENT_USER,
    "_schema" text default CURRENT_SCHEMA,
    "_schemas" name[] default current_schemas(true),
    "_pid" integer default pg_backend_pid(),
    "log_type" text,
    "query" text,
    "content" jsonb
);


alter table "public"."supascript_log" enable row level security;

CREATE UNIQUE INDEX supascript_js_modules_pkey ON public.supascript_js_modules USING btree (module);

CREATE UNIQUE INDEX supascript_log_pkey ON public.supascript_log USING btree (id);

alter table "public"."supascript_js_modules" add constraint "supascript_js_modules_pkey" PRIMARY KEY using index "supascript_js_modules_pkey";

alter table "public"."supascript_log" add constraint "supascript_log_pkey" PRIMARY KEY using index "supascript_log_pkey";

set check_function_bodies = off;

create type "public"."http_header" as ("field" character varying, "value" character varying);

create type "public"."http_request" as ("method" http_method, "uri" character varying, "headers" http_header[], "content_type" character varying, "content" character varying);

create type "public"."http_response" as ("status" integer, "content_type" character varying, "headers" http_header[], "content" character varying);

CREATE OR REPLACE FUNCTION public.supascript_init()
 RETURNS void
 LANGUAGE plv8
AS $function$

    this.moduleCache = {};
    
    // this handles "TypeError: Do not know how to serialize a BigInt"
    function toJson(data) {
        if (data !== undefined) {
            return JSON.stringify(data, (_, v) => typeof v === 'bigint' ? `${v}#bigint` : v)
                .replace(/"(-?\d+)#bigint"/g, (_, a) => a);
        }
    }

    this.console = {
        timers:{},
        write_to_log: function() {
            const arr = [];
            for (let i=0; i < arguments.length; i++) {
                if (!(i === 1 && arguments[0] === 'ASSERT')) {                    
                    const arg = JSON.parse(toJson(arguments[i])); // required to handle bigint
                    arr.push(arg);
                }
            }
            let query = '';
            try {
                query = JSON.stringify(sql('select current_query()')[0].current_query);
                if (query.length > 23 && query.substr(0,23).toLowerCase() === '"with pgrst_source as (') {
                    query = query.substr(23);
                    let index = query.indexOf('AS pgrst_scalar');
                    if (index < 0) { index = 999; };
                    query = query.substr(0,index);
                    query = query.replace(new RegExp(String.fromCharCode(92, 92, 34), 'g'), String.fromCharCode(34));
                }
            } catch (queryParseError) {
                query = 'query parse error';
            }
            const log_type = arr.shift();
            sql(`insert into supascript_log (content, log_type, query) values ($1, $2, $3)`,[arr, log_type, query]);
        },
        log: function() {
            console.write_to_log('LOG', ...arguments);
        },
        info: function() {
            console.write_to_log('INFO', ...arguments);
        },
        warn: function() {
            console.write_to_log('WARN', ...arguments);
        },
        assert: function() {
            if (arguments[0] === false) {
                // arguments.shift(); // remove assert expression
                console.write_to_log('ASSERT', ...arguments); // log rest of arguments (1 to n)
            }
        },
        error: function() {
            console.write_to_log('ERROR', ...arguments);
        },
        time: function(label = 'DEFAULT_TIMER') {
            this.timers[label] = +new Date();
        },
        timeEnd: function(label = 'DEFAULT_TIMER') {
            console.write_to_log('TIMER',label,+new Date() - this.timers[label]);
            delete this.timers[label];
        }

    };
    
    // execute a Postgresql function
    // i.e. exec('my_function',['parm1', 123, {"item_name": "test json object"}])
    this.exec = function(function_name, parms) {
      var func = plv8.find_function(function_name);
      return func(...parms);
    }

    this.load = function(key, source) {
        var module = {exports: {}};
        try {
            eval("(function(module, exports) {" + source + "; })")(module, module.exports);
        } catch (err) {
            plv8.elog(ERROR, `eval error in source: ${err} (SOURCE): ${source}`);
        }

        // store in cache
        moduleCache[key] = module.exports;
        return module.exports;
    };

    // execute a sql statement against the Postgresql database with optional args
    // i.e. sql('select * from people where first_name = $1 and last_name = $2', ['John', 'Smith'])
    this.sql = function(sql_statement, args) {
      if (args) {
        return plv8.execute(sql_statement, args);
      } else {
        return plv8.execute(sql_statement);
      }
    };

    // emulate node.js "require", with automatic download from the internet via CDN sites
    // optional autoload (boolean) parameter allows the module to be preloaded later
    // i.e. var myModule = require('https://some.cdn.com/module_content.js', true)
    this.require = function(module, autoload) {
        if (module === 'http' || module === 'https') {
          // emulate NodeJS require('http')
          module = 'https://raw.githubusercontent.com/burggraf/SupaScript/main/modules/http.js';
        }
        if(moduleCache[module])
            return moduleCache[module];
        var rows = plv8.execute(
            'select source from supascript_js_modules where module = $1',
            [module]
        );

        if (rows.length === 0 && module.substr(0,4) === 'http') {
            try {
                source = plv8.execute(`SELECT content FROM http_get('${module}');`)[0].content;
            } catch (err) {
                plv8.elog(ERROR, `Could not load module through http: ${module}`, JSON.stringify(err));
            }
            try {
                /* the line below is written purely for esthetic reasons, so as not to mess up the online source editor */
                /* when using standard regExp expressions, the single-quote char messes up the code highlighting */
                /* in the editor and everything looks funky */
                const quotedSource = source.replace(new RegExp(String.fromCharCode(39), 'g'), String.fromCharCode(39, 39));

                plv8.execute(`insert into supascript_js_modules (module, autoload, source) values ('${module}', ${autoload ? true : false}, '${quotedSource}')`);
            } catch (err) {
                plv8.elog(ERROR, `Error inserting module into supascript_js_modules: ${err} ${module}, ${autoload ? true : false}, '${plv8.quote_literal(source)}'`);
            }
            return load(module, source);
        } else if(rows.length === 0) {
            plv8.elog(NOTICE, `Could not load module: ${module}`);
            return null;
        } else {
            return load(module, rows[0].source);
        }

    };

    // Grab modules worth auto-loading at context start and let them cache
    var query = `select module, source from supascript_js_modules where autoload = true`;
    plv8.execute(query).forEach(function(row) {
        this.load(row.module, row.source);
    });
$function$
;