set check_function_bodies = off;

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
END;$function$
;