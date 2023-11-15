-- drop policy "CREATE: Disallow duplicate requests" on "public"."p2p_requests";

-- drop policy "CREATE: The Receiver ID must be different from the Sender ID" on "public"."p2p_requests";

-- drop policy "UPDATE: Receiver can only update the row" on "public"."p2p_requests";

-- set check_function_bodies = off;

-- CREATE OR REPLACE FUNCTION public.p2p_requests_cant_have_same_sender_and_receiver_id()
--  RETURNS trigger
--  LANGUAGE plpgsql
-- AS $function$begin

-- if new.receiver_id = new.sender_id then 
--   raise exception 'You cannot send requests to yourself';  
-- end if;
-- return new;
-- end;$function$
-- ;

-- CREATE OR REPLACE FUNCTION public.only_receiver_can_update_request()
--  RETURNS trigger
--  LANGUAGE plpgsql
-- AS $function$BEGIN
--   -- Only allow updating of the accepted_at and is_accepted fields
--   NEW.accepted_at := COALESCE(NEW.accepted_at, OLD.accepted_at);
--   NEW.is_accepted := COALESCE(NEW.is_accepted, OLD.is_accepted);

--   -- re-assign any additional fields to null
--   -- NEW.request_id := NULL;
--   -- NEW.sender_id := NULL;
--   -- NEW.receiver_id := NULL;
--   -- NEW.sent_at := NULL;


--   RETURN NEW;
-- END;
-- $function$
-- ;

-- create policy "CREATE: Only Authenticated Users Can Insert"
-- on "public"."p2p_requests"
-- as permissive
-- for insert
-- to authenticated
-- with check (true);


-- create policy "UPDATE: Receiver can only update the row"
-- on "public"."p2p_requests"
-- as permissive
-- for update
-- to authenticated
-- using (true)
-- with check ((auth.uid() = receiver_id));


-- CREATE TRIGGER p2p_requests_cant_have_same_sender_and_receiver_id_trigger BEFORE INSERT ON public.p2p_requests FOR EACH ROW EXECUTE FUNCTION p2p_requests_cant_have_same_sender_and_receiver_id();