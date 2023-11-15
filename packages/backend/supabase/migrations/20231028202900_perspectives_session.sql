create table "public"."working_perspective_positioning" (
    "id" bigint generated by default as identity not null,
    "collaborator_one_uid" uuid not null,
    "collaborator_two_uid" uuid not null,
    "collaborator_one_quadrant" bigint not null default '-1' :: integer,
    "collaborator_two_quadrant" bigint not null default '-1' :: integer
);

alter table
    "public"."working_perspective_positioning" enable row level security;

CREATE UNIQUE INDEX working_perspective_positioning_pkey ON public.working_perspective_positioning USING btree (id);

alter table
    "public"."working_perspective_positioning"
add
    constraint "working_perspective_positioning_pkey" PRIMARY KEY using index "working_perspective_positioning_pkey";

alter table
    "public"."working_perspective_positioning"
add
    constraint "working_perspective_positioning_collaborator_one_uid_fkey" FOREIGN KEY (collaborator_one_uid) REFERENCES auth.users(id) not valid;

alter table
    "public"."working_perspective_positioning" validate constraint "working_perspective_positioning_collaborator_one_uid_fkey";

alter table
    "public"."working_perspective_positioning"
add
    constraint "working_perspective_positioning_collaborator_two_uid_fkey" FOREIGN KEY (collaborator_two_uid) REFERENCES auth.users(id) not valid;

alter table
    "public"."working_perspective_positioning" validate constraint "working_perspective_positioning_collaborator_two_uid_fkey";

create policy "Can Only Read Documents That They Are Co-Authors Of" on "public"."working_perspective_positioning" as permissive for
select
    to authenticated using (
        (
            (auth.uid() = collaborator_one_uid)
            OR (auth.uid() = collaborator_two_uid)
        )
    );

create policy "Enable insert for authenticated users only" on "public"."working_perspective_positioning" as permissive for
insert
    to authenticated with check (true);

create policy "They Can Only Update Documents That They Are Co-Authors Of" on "public"."working_perspective_positioning" as permissive for
update
    to authenticated using (
        (
            (auth.uid() = collaborator_one_uid)
            OR (auth.uid() = collaborator_two_uid)
        )
    );

alter publication supabase_realtime
add
    table public.working_perspective_positioning;


drop policy "They Can Only Update Documents That They Are Co-Authors Of" on "public"."working_collaborative_scheduling";

create policy "They Can Only Update Documents That They Are Co-Authors Of"
on "public"."working_collaborative_scheduling"
as permissive
for update
to authenticated
using (((auth.uid() = collaborator_one_uid) OR (auth.uid() = collaborator_two_uid)));

create table "public"."p2p_perspectives_tracking" (
    "id" bigint generated by default as identity not null,
    "collaborator_one_uid" uuid not null,
    "collaborator_two_uid" uuid not null,
    "current_perspectives" text[] not null,
    "current_committed_at" timestamp with time zone not null default now(),
    "past_perspectives" jsonb
);


alter table "public"."p2p_perspectives_tracking" enable row level security;

CREATE UNIQUE INDEX p2p_perspectives_tracking_pkey ON public.p2p_perspectives_tracking USING btree (id);

alter table "public"."p2p_perspectives_tracking" add constraint "p2p_perspectives_tracking_pkey" PRIMARY KEY using index "p2p_perspectives_tracking_pkey";

alter table "public"."p2p_perspectives_tracking" add constraint "p2p_perspectives_tracking_collaborator_one_uid_fkey" FOREIGN KEY (collaborator_one_uid) REFERENCES auth.users(id) not valid;

alter table "public"."p2p_perspectives_tracking" validate constraint "p2p_perspectives_tracking_collaborator_one_uid_fkey";

alter table "public"."p2p_perspectives_tracking" add constraint "p2p_perspectives_tracking_collaborator_two_uid_fkey" FOREIGN KEY (collaborator_two_uid) REFERENCES auth.users(id) not valid;

alter table "public"."p2p_perspectives_tracking" validate constraint "p2p_perspectives_tracking_collaborator_two_uid_fkey";

alter table "public"."p2p_perspectives_tracking" add constraint "p2p_perspectives_tracking_past_perspectives_check" CHECK (jsonb_matches_schema('{"type": "object","properties": {"commits": {"type": "array","items": {"type": "object","properties": {"dateOfCommit": "string","perspectives": {"type": "array","items": {"type": "string"}}}}}}}'::json, past_perspectives)) not valid;

alter table "public"."p2p_perspectives_tracking" validate constraint "p2p_perspectives_tracking_past_perspectives_check";

create policy "Can Only Read Documents That They Are Co-Authors Of"
on "public"."p2p_perspectives_tracking"
as permissive
for select
to authenticated
using (((auth.uid() = collaborator_one_uid) OR (auth.uid() = collaborator_two_uid)));


create policy "Enable insert for authenticated users only"
on "public"."p2p_perspectives_tracking"
as permissive
for insert
to authenticated
with check (true);


create policy "They Can Only Update Documents That They Are Co-Authors Of"
on "public"."p2p_perspectives_tracking"
as permissive
for update
to authenticated
using (((auth.uid() = collaborator_one_uid) OR (auth.uid() = collaborator_two_uid)));


alter table "public"."working_collaborative_documents" drop constraint "working_collaborative_p2p_purpose_documents_doc_type_check";

alter table "public"."working_collaborative_documents" add constraint "working_collaborative_p2p_purpose_documents_doc_type_check" CHECK ((doc_type = ANY (ARRAY['purpose'::text, 'collective'::text, 'solo'::text, 'perspective'::text]))) not valid;

alter table "public"."working_collaborative_documents" validate constraint "working_collaborative_p2p_purpose_documents_doc_type_check";


set check_function_bodies = off;

CREATE OR REPLACE FUNCTION internal_functions.collaborative_doc_commit_checker()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
  IF (
    NEW.collaborator_one_wants_to_commit = true AND
    NEW.collaborator_two_wants_to_commit  = true AND
    NEW.doc_type != 'perspective'::text
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
END;
$function$
;

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.is_valid_perspectives_jsonb(incoming_perspectives_jsonb jsonb)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
BEGIN 
  RETURN (
  jsonb_matches_schema (
    '
    {
     "type": "object",
      "properties": {
        "commits": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "dateOfCommit": {
                "type": "string"
              },
              "perspectives": {
                "type": "array",
                "items": {
                  "type": "string"
                }
              }
            }
          }
        }
      }
    }',
    incoming_perspectives_jsonb
    ));
    END;
$function$
;


alter table "public"."p2p_perspectives_tracking" drop constraint "p2p_perspectives_tracking_past_perspectives_check";

alter table "public"."working_perspective_positioning" add column "staging_area" text[];

alter table "public"."p2p_perspectives_tracking" add constraint "p2p_perspectives_tracking_past_perspectives_check" CHECK (is_valid_perspectives_jsonb(past_perspectives)) not valid;

alter table "public"."p2p_perspectives_tracking" validate constraint "p2p_perspectives_tracking_past_perspectives_check";


set check_function_bodies = off;

CREATE OR REPLACE FUNCTION internal_functions.collaborative_doc_commit_checker()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
  IF (
    NEW.collaborator_one_wants_to_commit = true AND
    NEW.collaborator_two_wants_to_commit  = true AND
    NEW.doc_type != 'perspective'::text
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

alter table "public"."p2p_perspectives_tracking" alter column "past_perspectives" set default '{}'::jsonb;

alter table "public"."p2p_perspectives_tracking" alter column "past_perspectives" set not null;

alter table "public"."working_perspective_positioning" add column "last_edited_by" uuid;

alter table "public"."working_perspective_positioning" add constraint "working_perspective_positioning_last_edited_by_fkey" FOREIGN KEY (last_edited_by) REFERENCES auth.users(id) not valid;

alter table "public"."working_perspective_positioning" validate constraint "working_perspective_positioning_last_edited_by_fkey";

alter table "public"."working_perspective_positioning" alter column "collaborator_one_quadrant" set default '0'::bigint;

alter table "public"."working_perspective_positioning" alter column "collaborator_two_quadrant" set default '0'::bigint;