set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_valid_app_versions()
 RETURNS text[]
 LANGUAGE plpgsql
AS $function$BEGIN
    RETURN ARRAY['1.60.0', '1.61.0', '1.62.0'];
END;$function$
;