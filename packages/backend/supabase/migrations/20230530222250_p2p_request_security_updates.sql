-- set check_function_bodies = off;

-- CREATE OR REPLACE FUNCTION public.enforce_unique_p2p_requests()
--  RETURNS trigger
--  LANGUAGE plpgsql
-- AS $function$begin
--   if exists (
--     select 1 from public.p2p_requests
--     where sender_id = new.sender_id
--     and receiver_id = new.receiver_id
--     and accepted_at is null
--   ) then
--     raise exception 'A request already exists between these users';
--   end if;
  
--   if exists (
--     select 1 from public.p2p_requests
--     where sender_id = new.sender_id
--     and receiver_id = new.receiver_id
--     and accepted_at is not null
--   ) then
--     raise exception 'A request has already been accepted between these users';
--   end if;
  
--   if exists (
--     select 1 from public.p2p_requests
--     where sender_id = new.receiver_id
--     and receiver_id = new.sender_id
--     and accepted_at is null
--   ) then
--     raise exception 'A request has already been sent from the receiver to the sender';
--   end if;
  
--   return new;
-- end;$function$
-- ;

-- CREATE OR REPLACE FUNCTION public.only_receiver_can_update_request()
--  RETURNS trigger
--  LANGUAGE plpgsql
-- AS $function$BEGIN
--   -- Only allow updating of the accepted_at and is_accepted fields
--   NEW.accepted_at := COALESCE(NEW.accepted_at, OLD.accepted_at);
--   NEW.is_accepted := COALESCE(NEW.is_accepted, OLD.is_accepted);
--   RETURN NEW;
-- END;
-- $function$
-- ;

-- CREATE TRIGGER enforce_unique_p2p_requests_trigger BEFORE INSERT ON public.p2p_requests FOR EACH ROW EXECUTE FUNCTION enforce_unique_p2p_requests();

-- CREATE TRIGGER only_receiver_can_update_request_trigger BEFORE UPDATE ON public.p2p_requests FOR EACH ROW EXECUTE FUNCTION only_receiver_can_update_request();