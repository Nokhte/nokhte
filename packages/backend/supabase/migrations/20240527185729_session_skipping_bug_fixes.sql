alter table "public"."st_active_nokhte_sessions" add column "leader_is_whitelisted" boolean not null;

alter table "public"."st_active_nokhte_sessions" drop column "leader_is_whitelisted";

alter table "public"."st_active_nokhte_sessions" add column "is_whitelisted" boolean not null;


alter table "public"."finished_nokhte_sessions" drop constraint "finished_nokhte_sessions_pkey";

drop index if exists "public"."finished_nokhte_sessions_pkey";

alter table "public"."finished_nokhte_sessions" drop column "id";

CREATE UNIQUE INDEX finished_nokhte_sessions_pkey ON public.finished_nokhte_sessions USING btree (session_uid);

alter table "public"."finished_nokhte_sessions" add constraint "finished_nokhte_sessions_pkey" PRIMARY KEY using index "finished_nokhte_sessions_pkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_valid_app_versions()
 RETURNS text[]
 LANGUAGE plpgsql
AS $function$BEGIN
    RETURN ARRAY['1.60.0', '1.61.0', '1.62.0', '1.63.0'];
END;$function$
;
