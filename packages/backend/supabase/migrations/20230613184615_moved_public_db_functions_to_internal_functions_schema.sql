create schema if not exists "internal_functions" AUTHORIZATION postgres;

-- Enable the "pg_jsonschema" extension
create schema if not exists extensions;
create extension pg_jsonschema with schema extensions;
