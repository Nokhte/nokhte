set check_function_bodies = off;

CREATE OR REPLACE FUNCTION internal_functions.enforce_unique_wayfarers()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
  IF EXISTS (
    SELECT 1 FROM public.p2p_collaborator_pool
    WHERE (wayfarer_uid = NEW.wayfarer_uid)) THEN
    RAISE EXCEPTION 'This User is already in the pool.';
  END IF;
  RETURN NEW;
END;$function$
;

CREATE OR REPLACE FUNCTION internal_functions.forge_the_collaboration()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
    -- Check if matched_uid is not null
    IF NEW.matched_uid IS NOT NULL THEN
        -- Insert into existing_collaborations
        INSERT INTO public.existing_collaborations (collaborator_one, collaborator_two)
        VALUES (NEW.wayfarer_uid, NEW.matched_uid);
    END IF;
    RETURN NEW;
END;
$function$
;

CREATE OR REPLACE FUNCTION internal_functions.enforce_unique_collaborations()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
  IF EXISTS (
    SELECT 1 FROM public.existing_collaborations
    WHERE (collaborator_one = NEW.collaborator_one AND collaborator_two = NEW.collaborator_two)
       OR (collaborator_one = NEW.collaborator_two AND collaborator_two = NEW.collaborator_one)
  ) THEN
    RAISE EXCEPTION 'A collaboration already exists between these users.';
  END IF;

  IF new.collaborator_one = new.collaborator_two THEN
    raise exception 'You cannot have a collabortion with yourself';
  END IF;
  RETURN NEW;
END$function$
;


CREATE TRIGGER enforce_unique_wayfarers BEFORE INSERT ON public.p2p_collaborator_pool FOR EACH ROW EXECUTE FUNCTION internal_functions.enforce_unique_wayfarers();

CREATE TRIGGER forge_the_collaboration BEFORE UPDATE ON public.p2p_collaborator_pool FOR EACH ROW EXECUTE FUNCTION internal_functions.forge_the_collaboration();