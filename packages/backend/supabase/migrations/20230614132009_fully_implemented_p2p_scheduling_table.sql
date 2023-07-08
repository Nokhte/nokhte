-- drop function if exists "internal_functions"."p2p_requests_cant_have_same_sender_and_receiver_id"();
create extension if not exists "pg_jsonschema" with schema "extensions";
set check_function_bodies = off;

CREATE OR REPLACE FUNCTION internal_functions.cant_have_same_sender_and_receiver_id()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$begin

if new.receiver_id = new.sender_id then 
  raise exception 'You cannot send requests to yourself';  
end if;
return new;
end;$function$
;

CREATE OR REPLACE FUNCTION internal_functions.cant_impersonate_requests()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$begin
IF NEW.sender_id != auth.uid() THEN
  RAISE EXCEPTION 'Invalid sender_id, no impersonation allowed';
END IF;

RETURN NEW;
end;$function$
;

CREATE OR REPLACE FUNCTION internal_functions.cant_impersonate_schedule_creation()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$begin
IF NEW.sender_id != auth.uid() THEN
  RAISE EXCEPTION 'Invalid uid, no impersonation allowed!!';
END IF;

RETURN NEW;
end;$function$
;

CREATE OR REPLACE FUNCTION internal_functions.cant_impersonate_username_creation()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$begin
IF NEW.uid != auth.uid() THEN
  RAISE EXCEPTION 'Invalid uid, no impersonation allowed!!';
END IF;

RETURN NEW;
end;$function$
;

CREATE OR REPLACE FUNCTION internal_functions.needs_to_have_accepted_request()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
IF EXISTS (
    SELECT 1
    FROM p2p_requests
    WHERE sender_id = new.sender_id
    AND receiver_id = new.receiver_id
    AND is_accepted = true
) THEN
  -- success case: they have a successful request
  RETURN NEW;
ELSE
  -- failure case
  RAISE EXCEPTION 'Consent Matters, Send a Request';
  END IF;
END$function$
;

CREATE OR REPLACE FUNCTION internal_functions.new_scheduling_request_validator()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
-- basically if they have an unresolved scheduling request
-- they can't make a new one
IF EXISTS (
  select 1 from public.p2p_scheduling
  where sender_id = new.sender_id
  and receiver_id = new.receiver_id
  and range_has_been_responded_to = false
) THEN
  RAISE EXCEPTION 'Resolve The Other Scheduling Request Before You Send Another';
  ELSE
  RETURN NEW;
END IF;

END;$function$
;

CREATE OR REPLACE FUNCTION internal_functions.p2p_schedule_only_receiver_update_validation()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
  if(auth.uid() == old.receiver_id) THEN
  NEW.range_has_been_responded_to := COALESCE(NEW.range_has_been_responded_to, OLD.range_has_been_responded_to);
  NEW.response_timestampz := COALESCE(NEW.response_timestampz, OLD.response_timestampz);
  RETURN NEW;
ELSE
  RAISE EXCEPTION 'Unauthorized Update, you are not the receiver';
END IF;
END;$function$
;

CREATE OR REPLACE FUNCTION internal_functions.p2p_scheduling_update_validation()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
  IF (auth.uid() = old.sender_id) THEN

  -- only time is agreed upon is allowed
  ASSERT NEW.time_is_agreed_upon IS NOT NULL, '`time_is_agreed_upon` must be included with sender updates';
  ASSERT NEW.scheduling_id = OLD.scheduling_id, '`scheduling_id` cannot be updated by sender';
  ASSERT NEW.sender_id = OLD.sender_id, '`sender_id` cannot be updated by sender';
  ASSERT NEW.receiver_id = OLD.receiver_id, '`receiver_id` cannot be updated by sender';
  ASSERT NEW.range_has_been_responded_to = OLD.range_has_been_responded_to, '`range_has_been_responded_to` cannot be updated by sender';
  -- ASSERT NEW.initial_time_ranges IS NULL, '`initial_time_ranges` cannot be updated by sender';
  ASSERT NEW.response_timestampz = OLD.response_timestampz, '`NEW.response_timestampz` cannot be updated by sender';
  RETURN NEW;
END IF;
IF (auth.uid() = old.receiver_id) THEN
  -- everything besides range_has_been_responded_to and
  -- response_timestampz can be updated
  ASSERT NEW.range_has_been_responded_to IS NOT NULL, '`range_has_been_responded_to` must be included in receiver update';
  ASSERT NEW.response_timestampz IS NOT NULL, '`response_timestampz` must be included in receiver update';

  ASSERT NEW.time_is_agreed_upon = OLD.time_is_agreed_upon, 'receiver is not authorized to update `time_is_agreed_upon`';
  ASSERT NEW.scheduling_id = OLD.scheduling_id, 'receiver is not authorized to update `scheduling_id`';
  ASSERT NEW.sender_id = OLD.sender_id, 'receiver is not authorized to update `sender_id`';
  ASSERT NEW.receiver_id = OLD.receiver_id, 'receiver is not authorized to update `receiver_id`';
  -- ASSERT NEW.initial_time_ranges IS NULL, 'receiver is not authorized to update `initial_time_ranges`';

  -- ASSERT COALESCE(NEW.time_is_agreed_upon, NEW.scheduling_id, NEW.sender_id, NEW.receiver_id, NEW.initial_time_ranges) IS NOT NULL, '`time_is_agreed_upon` nor `scheduling_id` nor `sender_id` nor `receiver_id` nor `initial_time_ranges` cannot be updated for receiver updates';

  RETURN NEW;
END IF;

RAISE EXCEPTION 'You are neither sender nor updater, why are you updating this?';

END;$function$
;


drop trigger if exists "enforce_unique_p2p_requests_trigger" on "public"."p2p_requests";

drop trigger if exists "only_receiver_can_update_request_trigger" on "public"."p2p_requests";

drop trigger if exists "p2p_requests_cant_have_same_sender_and_receiver_id_trigger" on "public"."p2p_requests";

create table "public"."p2p_scheduling" (
    "scheduling_id" uuid not null default gen_random_uuid(),
    "sender_id" uuid not null,
    "receiver_id" uuid not null,
    "time_is_agreed_upon" boolean not null default false,
    "range_has_been_responded_to" boolean not null default false,
    "initial_time_ranges" jsonb not null,
    check (
      jsonb_matches_schema(
        '
        {
          "type": "object",
          "ranges": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "start": {
                  "type": "string",
                  "format": "date-time"
                },
                "end": {
                  "type": "string",
                  "format": "date-time"
                }
              },
              "required": ["start", "end"]
            }
          },
          "required": ["ranges"]
        }',
      initial_time_ranges
      )
    ),
    "response_timestampz" timestamp with time zone
);


alter table "public"."p2p_scheduling" enable row level security;

CREATE UNIQUE INDEX p2p_scheduling_pkey ON public.p2p_scheduling USING btree (scheduling_id);

alter table "public"."p2p_scheduling" add constraint "p2p_scheduling_pkey" PRIMARY KEY using index "p2p_scheduling_pkey";

alter table "public"."p2p_scheduling" add constraint "p2p_scheduling_receiver_id_fkey" FOREIGN KEY (receiver_id) REFERENCES auth.users(id) not valid;

alter table "public"."p2p_scheduling" validate constraint "p2p_scheduling_receiver_id_fkey";

alter table "public"."p2p_scheduling" add constraint "p2p_scheduling_sender_id_fkey" FOREIGN KEY (sender_id) REFERENCES auth.users(id) not valid;

alter table "public"."p2p_scheduling" validate constraint "p2p_scheduling_sender_id_fkey";

create policy "CREATE: Only Authenticated Users Can Insert"
on "public"."p2p_scheduling"
as permissive
for insert
to authenticated
with check (true);


create policy "READ: Can Only Read What They Have Received"
on "public"."p2p_scheduling"
as permissive
for select
to authenticated
using ((receiver_id = auth.uid()));


create policy "READ: Can Only Read What They have Authored"
on "public"."p2p_scheduling"
as permissive
for select
to authenticated
using ((sender_id = auth.uid()));


create policy "UPDATE: Only Authenticated Users Can Update"
on "public"."p2p_scheduling"
as permissive
for update
to authenticated
using (true);


CREATE TRIGGER cant_have_same_sender_and_receiver_id_p2p_requests BEFORE INSERT ON public.p2p_requests FOR EACH ROW EXECUTE FUNCTION internal_functions.cant_have_same_sender_and_receiver_id();

CREATE TRIGGER cant_impersonate_requests BEFORE INSERT ON public.p2p_requests FOR EACH ROW EXECUTE FUNCTION internal_functions.cant_impersonate_requests();

CREATE TRIGGER enforce_unique_p2p_requests BEFORE INSERT ON public.p2p_requests FOR EACH ROW EXECUTE FUNCTION internal_functions.enforce_unique_p2p_requests();

CREATE TRIGGER only_receiver_can_update_request BEFORE UPDATE ON public.p2p_requests FOR EACH ROW EXECUTE FUNCTION internal_functions.only_receiver_can_update_request();

CREATE TRIGGER cant_have_same_sender_and_receiver_id_p2p_scheduling BEFORE INSERT ON public.p2p_scheduling FOR EACH ROW EXECUTE FUNCTION internal_functions.cant_have_same_sender_and_receiver_id();

CREATE TRIGGER cant_impersonate_schedule_creation BEFORE INSERT ON public.p2p_scheduling FOR EACH ROW EXECUTE FUNCTION internal_functions.cant_impersonate_schedule_creation();

CREATE TRIGGER needs_to_have_accepted_request BEFORE INSERT ON public.p2p_scheduling FOR EACH ROW EXECUTE FUNCTION internal_functions.needs_to_have_accepted_request();

CREATE TRIGGER new_scheduling_request_validator BEFORE INSERT ON public.p2p_scheduling FOR EACH ROW EXECUTE FUNCTION internal_functions.new_scheduling_request_validator();

CREATE TRIGGER p2p_scheduling_update_validation BEFORE UPDATE ON public.p2p_scheduling FOR EACH ROW EXECUTE FUNCTION internal_functions.p2p_scheduling_update_validation();

CREATE TRIGGER cant_impersonate_username_creation BEFORE INSERT ON public.usernames FOR EACH ROW EXECUTE FUNCTION internal_functions.cant_impersonate_username_creation();