create type "public"."session_phone_types" as enum ('speaking', 'solo_hybrid', 'group_hybrid', 'notes');

drop policy "UPDATE: Can update valid rows" on "public"."st_active_nokhte_sessions";

drop function if exists "public"."is_not_updating_has_premium_access"(_id bigint, _has_premium_access boolean[]);

alter table "public"."st_active_nokhte_sessions" drop constraint "st_active_nokhte_sessions_duplicate_pkey";

drop index if exists "public"."st_active_nokhte_sessions_duplicate_pkey";

create type "public"."session_presets_tags" as enum ('strict_seating', 'flexible_seating', 'hold_to_speak', 'tap_to_speak', 'notes_during', 'notes_after');

create table "public"."company_presets" (
    "uid" uuid not null default gen_random_uuid(),
    "name" text not null,
    "even_configuration" session_phone_types[] not null,
    "odd_configuration" session_phone_types[] not null,
    "tags" session_presets_tags[] not null
);


alter table "public"."company_presets" enable row level security;


  INSERT INTO public.company_presets (uid, name, even_configuration, odd_configuration, tags)
VALUES 
  (
    gen_random_uuid(),
    'Consultation' ,
    '{speaking, notes}',
    '{group_hybrid, speaking, notes}',
    '{hold_to_speak, strict_seating, notes_during}'
  ),

  (
    gen_random_uuid(), 
    'Collaboration' ,
    '{solo_hybrid}',
    '{solo_hybrid}',
    '{tap_to_speak, flexible_seating, notes_during}'
  ),
  (
    gen_random_uuid(), 
    'Socratic' ,       
    '{speaking}',
    '{speaking}',
    '{hold_to_speak, strict_seating, notes_after}'
  );

create table "public"."unified_presets" (
    "uid" uuid not null,
    "is_company_preset" boolean not null,
    "company_preset_id" uuid,
    "user_generated_preset_id" uuid
);


alter table "public"."unified_presets" enable row level security;

create table "public"."user_generated_presets" (
    "created_at" timestamp with time zone not null default now(),
    "uid" uuid not null
);


alter table "public"."user_generated_presets" enable row level security;

alter table "public"."st_active_nokhte_sessions" drop column "id";

alter table "public"."st_active_nokhte_sessions" add column "preset_uid" uuid not null;

drop type "public"."invitation_type";

CREATE UNIQUE INDEX company_presets_name_key ON public.company_presets USING btree (name);

CREATE UNIQUE INDEX company_presets_pkey ON public.company_presets USING btree (uid);

CREATE UNIQUE INDEX st_active_nokhte_sessions_pkey ON public.st_active_nokhte_sessions USING btree (session_uid);

CREATE UNIQUE INDEX unified_presets_pkey ON public.unified_presets USING btree (uid);

CREATE UNIQUE INDEX user_generated_presets_pkey ON public.user_generated_presets USING btree (uid);

CREATE UNIQUE INDEX user_generated_presets_uid_key ON public.user_generated_presets USING btree (uid);

alter table "public"."company_presets" add constraint "company_presets_pkey" PRIMARY KEY using index "company_presets_pkey";

alter table "public"."st_active_nokhte_sessions" add constraint "st_active_nokhte_sessions_pkey" PRIMARY KEY using index "st_active_nokhte_sessions_pkey";

alter table "public"."unified_presets" add constraint "unified_presets_pkey" PRIMARY KEY using index "unified_presets_pkey";

alter table "public"."user_generated_presets" add constraint "user_generated_presets_pkey" PRIMARY KEY using index "user_generated_presets_pkey";

alter table "public"."company_presets" add constraint "company_presets_name_key" UNIQUE using index "company_presets_name_key";

alter table "public"."st_active_nokhte_sessions" add constraint "st_active_nokhte_sessions_preset_uid_fkey" FOREIGN KEY (preset_uid) REFERENCES unified_presets(uid) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."st_active_nokhte_sessions" validate constraint "st_active_nokhte_sessions_preset_uid_fkey";

alter table "public"."unified_presets" add constraint "exclusive_or_constraint" CHECK (((is_company_preset AND (company_preset_id IS NOT NULL) AND (user_generated_preset_id IS NULL)) OR ((NOT is_company_preset) AND (company_preset_id IS NULL) AND (user_generated_preset_id IS NOT NULL)))) not valid;

alter table "public"."unified_presets" validate constraint "exclusive_or_constraint";

alter table "public"."unified_presets" add constraint "unified_presets_company_preset_id_fkey" FOREIGN KEY (company_preset_id) REFERENCES company_presets(uid) ON DELETE CASCADE not valid;

alter table "public"."unified_presets" validate constraint "unified_presets_company_preset_id_fkey";

alter table "public"."unified_presets" add constraint "unified_presets_user_generated_preset_id_fkey" FOREIGN KEY (user_generated_preset_id) REFERENCES user_generated_presets(uid) ON DELETE CASCADE not valid;

alter table "public"."unified_presets" validate constraint "unified_presets_user_generated_preset_id_fkey";

alter table "public"."user_generated_presets" add constraint "user_generated_presets_uid_key" UNIQUE using index "user_generated_presets_uid_key";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.is_not_updating_has_premium_access(_uid uuid, _has_premium_access boolean[])
 RETURNS boolean
 LANGUAGE sql
 SECURITY DEFINER
AS $function$
WITH original_row AS (
    SELECT has_premium_access
    FROM public.st_active_nokhte_sessions
    WHERE session_uid = _uid
)
SELECT (SELECT has_premium_access FROM original_row) = _has_premium_access;
$function$
;

grant delete on table "public"."unified_presets" to "anon";

grant insert on table "public"."unified_presets" to "anon";

grant references on table "public"."unified_presets" to "anon";

grant select on table "public"."unified_presets" to "anon";

grant trigger on table "public"."unified_presets" to "anon";

grant truncate on table "public"."unified_presets" to "anon";

grant update on table "public"."unified_presets" to "anon";

grant delete on table "public"."unified_presets" to "authenticated";

grant insert on table "public"."unified_presets" to "authenticated";

grant references on table "public"."unified_presets" to "authenticated";

grant select on table "public"."unified_presets" to "authenticated";

grant trigger on table "public"."unified_presets" to "authenticated";

grant truncate on table "public"."unified_presets" to "authenticated";

grant update on table "public"."unified_presets" to "authenticated";

grant delete on table "public"."unified_presets" to "service_role";

grant insert on table "public"."unified_presets" to "service_role";

grant references on table "public"."unified_presets" to "service_role";

grant select on table "public"."unified_presets" to "service_role";

grant trigger on table "public"."unified_presets" to "service_role";

grant truncate on table "public"."unified_presets" to "service_role";

grant update on table "public"."unified_presets" to "service_role";

grant delete on table "public"."user_generated_presets" to "anon";

grant insert on table "public"."user_generated_presets" to "anon";

grant references on table "public"."user_generated_presets" to "anon";

grant select on table "public"."user_generated_presets" to "anon";

grant trigger on table "public"."user_generated_presets" to "anon";

grant truncate on table "public"."user_generated_presets" to "anon";

grant update on table "public"."user_generated_presets" to "anon";

grant delete on table "public"."user_generated_presets" to "authenticated";

grant insert on table "public"."user_generated_presets" to "authenticated";

grant references on table "public"."user_generated_presets" to "authenticated";

grant select on table "public"."user_generated_presets" to "authenticated";

grant trigger on table "public"."user_generated_presets" to "authenticated";

grant truncate on table "public"."user_generated_presets" to "authenticated";

grant update on table "public"."user_generated_presets" to "authenticated";

grant delete on table "public"."user_generated_presets" to "service_role";

grant insert on table "public"."user_generated_presets" to "service_role";

grant references on table "public"."user_generated_presets" to "service_role";

grant select on table "public"."user_generated_presets" to "service_role";

grant trigger on table "public"."user_generated_presets" to "service_role";

grant truncate on table "public"."user_generated_presets" to "service_role";

grant update on table "public"."user_generated_presets" to "service_role";

create policy "Enable read access for all users"
on "public"."company_presets"
as permissive
for select
to authenticated
using (true);


create policy "UPDATE: Can update valid rows"
on "public"."st_active_nokhte_sessions"
as permissive
for update
to authenticated
using (((auth.uid() = ANY (collaborator_uids)) AND ((array_length(collaborator_uids, 1) < 4) OR ((true = ALL (has_premium_access)) AND is_not_updating_has_premium_access(session_uid, has_premium_access)))))
with check (((auth.uid() = ANY (collaborator_uids)) AND ((array_length(collaborator_uids, 1) < 4) OR (true = ALL (has_premium_access))) AND is_not_updating_has_premium_access(session_uid, has_premium_access)));


create policy "Enable read access for all users"
on "public"."unified_presets"
as permissive
for select
to public
using (true);

alter table "public"."st_active_nokhte_sessions" drop column "have_gyroscopes";

INSERT INTO public.unified_presets (uid, is_company_preset, company_preset_id)
SELECT uid, TRUE, uid
FROM public.company_presets;

alter table "public"."user_information" drop column "has_accessed_qr_code";

alter table "public"."user_information" add column "preferred_preset" uuid;

alter table "public"."user_information" add constraint "user_information_preferred_preset_fkey" FOREIGN KEY (preferred_preset) REFERENCES unified_presets(uid) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."user_information" validate constraint "user_information_preferred_preset_fkey";

alter table "public"."finished_nokhte_sessions" add column "preset_uid" uuid;

alter table "public"."st_active_nokhte_sessions" drop column "should_skip_instructions";

alter table "public"."finished_nokhte_sessions" add constraint "finished_nokhte_sessions_preset_uid_fkey" FOREIGN KEY (preset_uid) REFERENCES unified_presets(uid) ON UPDATE CASCADE not valid;

alter table "public"."finished_nokhte_sessions" validate constraint "finished_nokhte_sessions_preset_uid_fkey";

UPDATE finished_nokhte_sessions
SET preset_uid = (
    SELECT company_presets.uid
    FROM company_presets
    INNER JOIN unified_presets ON company_presets.uid = unified_presets.company_preset_id
    WHERE company_presets.name = 'Consultation'
);

alter table "public"."finished_nokhte_sessions" alter column "preset_uid" set not null;

CREATE INDEX finished_nokhte_sessions_collaborator_uids_idx ON public.finished_nokhte_sessions USING btree (collaborator_uids);

CREATE INDEX finished_nokhte_sessions_preset_uid_idx ON public.finished_nokhte_sessions USING btree (preset_uid);