create schema if not exists "internal_functions" AUTHORIZATION postgres;

-- grant supabase_admin to postgres;
-- ALTER schema internal_functions OWNER TO postgres;

set check_function_bodies = off;

-- CREATE OR REPLACE FUNCTION internal_functions.enforce_unique_p2p_requests()
--  RETURNS trigger
--  LANGUAGE plpgsql
-- AS $function$begin
--   if exists (
--     select 1 from public.p2p_requests
--     where sender_id = new.sender_id
--     and receiver_id = new.receiver_id
--     and responded_at is null
--   ) then
--     raise exception 'A request already exists between these users';
--   end if;
  
--   if exists (
--     select 1 from public.p2p_requests
--     where sender_id = new.sender_id
--     and receiver_id = new.receiver_id
--     and responded_at is not null
--   ) then
--     raise exception 'A request has already been accepted between these users';
--   end if;
  
--   if exists (
--     select 1 from public.p2p_requests
--     where sender_id = new.receiver_id
--     and receiver_id = new.sender_id
--     and responded_at is null
--   ) then
--     raise exception 'A request has already been sent from the receiver to the sender';
--   end if;
  
--   return new;
-- end;$function$
-- ;

-- CREATE OR REPLACE FUNCTION internal_functions.only_receiver_can_update_request()
--  RETURNS trigger
--  LANGUAGE plpgsql
-- AS $function$BEGIN
--   -- Only allow updating of the accepted_at and is_accepted fields
--   NEW.responded_at := COALESCE(NEW.responded_at, OLD.responded_at);
--   NEW.is_accepted := COALESCE(NEW.is_accepted, OLD.is_accepted);
--   RETURN NEW;
-- END;
-- $function$
-- ;

-- CREATE OR REPLACE FUNCTION internal_functions.p2p_requests_cant_have_same_sender_and_receiver_id()
--  RETURNS trigger
--  LANGUAGE plpgsql
-- AS $function$begin

-- if new.receiver_id = new.sender_id then 
--   raise exception 'You cannot send requests to yourself';  
-- end if;
-- return new;
-- end;$function$
-- ;


-- drop trigger if exists "enforce_unique_p2p_requests_trigger" on "public"."p2p_requests";

-- drop trigger if exists "only_receiver_can_update_request_trigger" on "public"."p2p_requests";

-- drop trigger if exists "p2p_requests_cant_have_same_sender_and_receiver_id_trigger" on "public"."p2p_requests";

drop function if exists "public"."enforce_unique_p2p_requests"();

drop function if exists "public"."only_receiver_can_update_request"();

drop function if exists "public"."p2p_requests_cant_have_same_sender_and_receiver_id"();

-- CREATE TRIGGER enforce_unique_p2p_requests_trigger BEFORE INSERT ON public.p2p_requests FOR EACH ROW EXECUTE FUNCTION internal_functions.enforce_unique_p2p_requests();

-- CREATE TRIGGER only_receiver_can_update_request_trigger BEFORE UPDATE ON public.p2p_requests FOR EACH ROW EXECUTE FUNCTION internal_functions.only_receiver_can_update_request();

-- CREATE TRIGGER p2p_requests_cant_have_same_sender_and_receiver_id_trigger BEFORE INSERT ON public.p2p_requests FOR EACH ROW EXECUTE FUNCTION internal_functions.p2p_requests_cant_have_same_sender_and_receiver_id();