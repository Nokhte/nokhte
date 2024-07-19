CREATE OR REPLACE FUNCTION public.get_valid_app_versions()
 RETURNS text[]
 LANGUAGE plpgsql
AS $function$BEGIN
    RETURN ARRAY['1.70.0'];
END;$function$
;
