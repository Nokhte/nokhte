alter table "public"."working_collaborative_documents" add column "collaborator_one_wants_to_commit" boolean not null default false;

alter table "public"."working_collaborative_documents" add column "collaborator_two_wants_to_commit" boolean not null default false;    

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION internal_functions.collaborative_doc_commit_checker()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
  IF (
    NEW.collaborator_one_wants_to_commit = true AND
    NEW.collaborator_two_wants_to_commit  = true
  ) THEN
    INSERT INTO public.finished_collaborative_documents (
      collaborator_one_uid,
      collaborator_two_uid,
      content,
      doc_type
    ) VALUES (
      NEW.collaborator_one_uid,
      NEW.collaborator_two_uid,
      NEW.content,
      NEW.doc_type
    );
  END IF;
  RETURN NEW;
END;$function$
;


CREATE TRIGGER collaborative_doc_commit_checker AFTER UPDATE ON public.working_collaborative_documents FOR EACH ROW EXECUTE FUNCTION internal_functions.collaborative_doc_commit_checker();