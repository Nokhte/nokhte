create table "public"."company_presets" (
    "uid" uuid not null default gen_random_uuid(),
    "talking_ratio" smallint not null,
    "notes_ratio" smallint not null,
    "group_hybrid_ratio" real not null,
    "solo_hybrid_ratio" real not null,
    "name" text not null
);


alter table "public"."company_presets" enable row level security;

alter table "public"."st_active_nokhte_sessions" drop column "have_gyroscopes";

drop type "public"."invitation_type";

CREATE UNIQUE INDEX company_presets_pkey ON public.company_presets USING btree (uid);

alter table "public"."company_presets" add constraint "company_presets_pkey" PRIMARY KEY using index "company_presets_pkey";

grant delete on table "public"."company_presets" to "anon";

grant insert on table "public"."company_presets" to "anon";

grant references on table "public"."company_presets" to "anon";

grant select on table "public"."company_presets" to "anon";

grant trigger on table "public"."company_presets" to "anon";

grant truncate on table "public"."company_presets" to "anon";

grant update on table "public"."company_presets" to "anon";

grant delete on table "public"."company_presets" to "authenticated";

grant insert on table "public"."company_presets" to "authenticated";

grant references on table "public"."company_presets" to "authenticated";

grant select on table "public"."company_presets" to "authenticated";

grant trigger on table "public"."company_presets" to "authenticated";

grant truncate on table "public"."company_presets" to "authenticated";

grant update on table "public"."company_presets" to "authenticated";

grant delete on table "public"."company_presets" to "service_role";

grant insert on table "public"."company_presets" to "service_role";

grant references on table "public"."company_presets" to "service_role";

grant select on table "public"."company_presets" to "service_role";

grant trigger on table "public"."company_presets" to "service_role";

grant truncate on table "public"."company_presets" to "service_role";

grant update on table "public"."company_presets" to "service_role";

create policy "Enable read access for all users"
on "public"."company_presets"
as permissive
for select
to authenticated
using (true);


INSERT INTO public.company_presets (uid, talking_ratio, notes_ratio, group_hybrid_ratio,solo_hybrid_ratio, name)
VALUES 
  (
    gen_random_uuid(), 
    1,                
    0,                
    0,                
    0,                
    'Socratic'        
  ),
  (
    gen_random_uuid(),
    1,                
    1,                
    .5,               
    0,
    'Consultative' 
  ),
  (
    gen_random_uuid(), 
    0,                
    0,                
    0,                
    1,
    'Collaborative' 
  );


create table "public"."unified_presets" (
    "id" uuid not null,
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

CREATE UNIQUE INDEX unified_presets_pkey ON public.unified_presets USING btree (id);

CREATE UNIQUE INDEX user_generated_presets_pkey ON public.user_generated_presets USING btree (uid);

CREATE UNIQUE INDEX user_generated_presets_uid_key ON public.user_generated_presets USING btree (uid);

alter table "public"."unified_presets" add constraint "unified_presets_pkey" PRIMARY KEY using index "unified_presets_pkey";

alter table "public"."user_generated_presets" add constraint "user_generated_presets_pkey" PRIMARY KEY using index "user_generated_presets_pkey";

alter table "public"."unified_presets" add constraint "exclusive_or_constraint" CHECK (((is_company_preset AND (company_preset_id IS NOT NULL) AND (user_generated_preset_id IS NULL)) OR ((NOT is_company_preset) AND (company_preset_id IS NULL) AND (user_generated_preset_id IS NOT NULL)))) not valid;

alter table "public"."unified_presets" validate constraint "exclusive_or_constraint";

alter table "public"."unified_presets" add constraint "unified_presets_company_preset_id_fkey" FOREIGN KEY (company_preset_id) REFERENCES company_presets(uid) ON DELETE CASCADE not valid;

alter table "public"."unified_presets" validate constraint "unified_presets_company_preset_id_fkey";

alter table "public"."unified_presets" add constraint "unified_presets_user_generated_preset_id_fkey" FOREIGN KEY (user_generated_preset_id) REFERENCES user_generated_presets(uid) ON DELETE CASCADE not valid;

alter table "public"."unified_presets" validate constraint "unified_presets_user_generated_preset_id_fkey";

alter table "public"."user_generated_presets" add constraint "user_generated_presets_uid_key" UNIQUE using index "user_generated_presets_uid_key";

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

alter table "public"."unified_presets" drop constraint "unified_presets_pkey";

drop index if exists "public"."unified_presets_pkey";

alter table "public"."unified_presets" drop column "id";

alter table "public"."unified_presets" add column "uid" uuid not null;

CREATE UNIQUE INDEX unified_presets_pkey ON public.unified_presets USING btree (uid);

alter table "public"."unified_presets" add constraint "unified_presets_pkey" PRIMARY KEY using index "unified_presets_pkey";


INSERT INTO public.unified_presets (uid, is_company_preset, company_preset_id)
SELECT uid, TRUE, uid
FROM public.company_presets;

--
drop policy "UPDATE: Can update valid rows" on "public"."st_active_nokhte_sessions";

drop function if exists "public"."is_not_updating_has_premium_access"(_id bigint, _has_premium_access boolean[]);

alter table "public"."st_active_nokhte_sessions" drop constraint "st_active_nokhte_sessions_duplicate_pkey";

drop index if exists "public"."st_active_nokhte_sessions_duplicate_pkey";

alter table "public"."st_active_nokhte_sessions" drop column "id";

alter table "public"."st_active_nokhte_sessions" add column "preset_uid" uuid not null;

CREATE UNIQUE INDEX st_active_nokhte_sessions_pkey ON public.st_active_nokhte_sessions USING btree (session_uid);

alter table "public"."st_active_nokhte_sessions" add constraint "st_active_nokhte_sessions_pkey" PRIMARY KEY using index "st_active_nokhte_sessions_pkey";

alter table "public"."st_active_nokhte_sessions" add constraint "st_active_nokhte_sessions_preset_uid_fkey" FOREIGN KEY (preset_uid) REFERENCES unified_presets(uid) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."st_active_nokhte_sessions" validate constraint "st_active_nokhte_sessions_preset_uid_fkey";

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

create policy "UPDATE: Can update valid rows"
on "public"."st_active_nokhte_sessions"
as permissive
for update
to authenticated
using (((auth.uid() = ANY (collaborator_uids)) AND ((array_length(collaborator_uids, 1) < 4) OR ((true = ALL (has_premium_access)) AND is_not_updating_has_premium_access(session_uid, has_premium_access)))))
with check (((auth.uid() = ANY (collaborator_uids)) AND ((array_length(collaborator_uids, 1) < 4) OR (true = ALL (has_premium_access))) AND is_not_updating_has_premium_access(session_uid, has_premium_access)));

create type "public"."session_phone_types" as enum ('talking', 'solo_hybrid', 'group_hybrid', 'notes');

alter table "public"."company_presets" alter column "solo_hybrid_ratio" set data type smallint using "solo_hybrid_ratio"::smallint;

alter table "public"."st_active_nokhte_sessions" add column "phone_types" session_phone_types[] not null;

alter table "public"."st_active_nokhte_sessions" drop constraint "st_active_nokhte_sessions_preset_uid_fkey";

alter table "public"."st_active_nokhte_sessions" drop column "phone_types";

alter table "public"."st_active_nokhte_sessions" drop column "preset_uid";

alter table "public"."st_active_nokhte_sessions" add column "have_gyroscopes" boolean[] not null default '{t}'::boolean[];

alter table "public"."st_active_nokhte_sessions" add column "preset_uid" uuid not null;

CREATE UNIQUE INDEX company_presets_name_key ON public.company_presets USING btree (name);

alter table "public"."company_presets" add constraint "company_presets_name_key" UNIQUE using index "company_presets_name_key";

alter table "public"."st_active_nokhte_sessions" add constraint "st_active_nokhte_sessions_preset_uid_fkey" FOREIGN KEY (preset_uid) REFERENCES unified_presets(uid) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."st_active_nokhte_sessions" validate constraint "st_active_nokhte_sessions_preset_uid_fkey";

create policy "Enable read access for all users"
on "public"."unified_presets"
as permissive
for select
to public
using (true);
