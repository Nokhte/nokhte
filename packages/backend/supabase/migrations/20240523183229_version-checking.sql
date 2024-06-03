drop function if exists "public"."is_valid_individual_session_metadata_jsonb"(incoming_session_metadata_jsonb jsonb);

drop function if exists "public"."is_valid_perspectives_jsonb"(incoming_perspectives_jsonb jsonb);

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION get_valid_app_versions()
RETURNS text[] AS $$
BEGIN
    RETURN ARRAY['1.60.0', '1.61.0'];
END;
$$ LANGUAGE plpgsql;

alter table "public"."user_metadata" add column "is_whitelisted" boolean not null default false;