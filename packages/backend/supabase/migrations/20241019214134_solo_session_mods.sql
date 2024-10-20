

-- Step 1: Add a new column to user_information for the new foreign key
ALTER TABLE public.user_information
ADD COLUMN new_preferred_preset uuid;

-- Step 2: Update the new column with the correct company_preset_id
UPDATE public.user_information ui
SET new_preferred_preset = cp.uid
FROM public.unified_presets up
JOIN public.company_presets cp ON up.company_preset_id = cp.uid
WHERE ui.preferred_preset = up.uid AND up.is_company_preset = true;

-- Step 3: Update the new column for user-generated presets (set to NULL or handle as needed)
UPDATE public.user_information ui
SET new_preferred_preset = NULL
FROM public.unified_presets up
WHERE ui.preferred_preset = up.uid AND up.is_company_preset = false;

-- Step 4: Drop the old foreign key constraint
ALTER TABLE public.user_information
DROP CONSTRAINT user_information_preferred_preset_fkey;

-- Step 5: Drop the old preferred_preset column
ALTER TABLE public.user_information
DROP COLUMN preferred_preset;

-- Step 6: Rename the new column to preferred_preset
ALTER TABLE public.user_information
RENAME COLUMN new_preferred_preset TO preferred_preset;

-- Step 7: Add the new foreign key constraint
ALTER TABLE public.user_information
ADD CONSTRAINT user_information_preferred_preset_fkey
FOREIGN KEY (preferred_preset)
REFERENCES public.company_presets (uid)
ON UPDATE CASCADE
ON DELETE SET NULL;

-- Optional: Drop the unified_presets table if it's no longer needed
-- DROP TABLE public.unified_presets;


drop policy "Enable read access for all users" on "public"."unified_presets";

revoke delete on table "public"."unified_presets" from "anon";

revoke insert on table "public"."unified_presets" from "anon";

revoke references on table "public"."unified_presets" from "anon";

revoke select on table "public"."unified_presets" from "anon";

revoke trigger on table "public"."unified_presets" from "anon";

revoke truncate on table "public"."unified_presets" from "anon";

revoke update on table "public"."unified_presets" from "anon";

revoke delete on table "public"."unified_presets" from "authenticated";

revoke insert on table "public"."unified_presets" from "authenticated";

revoke references on table "public"."unified_presets" from "authenticated";

revoke select on table "public"."unified_presets" from "authenticated";

revoke trigger on table "public"."unified_presets" from "authenticated";

revoke truncate on table "public"."unified_presets" from "authenticated";

revoke update on table "public"."unified_presets" from "authenticated";

revoke delete on table "public"."unified_presets" from "service_role";

revoke insert on table "public"."unified_presets" from "service_role";

revoke references on table "public"."unified_presets" from "service_role";

revoke select on table "public"."unified_presets" from "service_role";

revoke trigger on table "public"."unified_presets" from "service_role";

revoke truncate on table "public"."unified_presets" from "service_role";

revoke update on table "public"."unified_presets" from "service_role";

alter table "public"."finished_nokhte_sessions" drop constraint "finished_nokhte_sessions_preset_uid_fkey";

alter table "public"."unified_presets" drop constraint "exclusive_or_constraint";

alter table "public"."unified_presets" drop constraint "unified_presets_company_preset_id_fkey";

alter table "public"."unified_presets" drop constraint "unified_presets_user_generated_preset_id_fkey";

alter table "public"."user_information" drop constraint "user_information_preferred_preset_fkey";

alter table "public"."st_active_nokhte_sessions" drop constraint "st_active_nokhte_sessions_preset_uid_fkey";

alter table "public"."unified_presets" drop constraint "unified_presets_pkey";

drop index if exists "public"."finished_nokhte_sessions_preset_uid_idx";

drop index if exists "public"."unified_presets_pkey";

drop table "public"."unified_presets";

alter table "public"."finished_nokhte_sessions" drop column "preset_uid";

alter table "public"."user_generated_presets" drop column "created_at";

alter table "public"."user_generated_presets" add column "company_preset" uuid not null;

alter table "public"."user_generated_presets" add column "options" jsonb not null default '{}'::jsonb;

alter table "public"."user_generated_presets" add column "owner_uid" uuid not null default auth.uid();

alter table "public"."user_information" add constraint "user_information_new_preferred_preset_fkey" FOREIGN KEY (preferred_preset) REFERENCES company_presets(uid) not valid;

alter table "public"."user_information" validate constraint "user_information_new_preferred_preset_fkey";

alter table "public"."st_active_nokhte_sessions" add constraint "st_active_nokhte_sessions_preset_uid_fkey" FOREIGN KEY (preset_uid) REFERENCES company_presets(uid) not valid;

alter table "public"."st_active_nokhte_sessions" validate constraint "st_active_nokhte_sessions_preset_uid_fkey";

revoke delete on table "public"."user_generated_presets" from "anon";

revoke insert on table "public"."user_generated_presets" from "anon";

revoke references on table "public"."user_generated_presets" from "anon";

revoke select on table "public"."user_generated_presets" from "anon";

revoke trigger on table "public"."user_generated_presets" from "anon";

revoke truncate on table "public"."user_generated_presets" from "anon";

revoke update on table "public"."user_generated_presets" from "anon";

revoke delete on table "public"."user_generated_presets" from "authenticated";

revoke insert on table "public"."user_generated_presets" from "authenticated";

revoke references on table "public"."user_generated_presets" from "authenticated";

revoke select on table "public"."user_generated_presets" from "authenticated";

revoke trigger on table "public"."user_generated_presets" from "authenticated";

revoke truncate on table "public"."user_generated_presets" from "authenticated";

revoke update on table "public"."user_generated_presets" from "authenticated";

revoke delete on table "public"."user_generated_presets" from "service_role";

revoke insert on table "public"."user_generated_presets" from "service_role";

revoke references on table "public"."user_generated_presets" from "service_role";

revoke select on table "public"."user_generated_presets" from "service_role";

revoke trigger on table "public"."user_generated_presets" from "service_role";

revoke truncate on table "public"."user_generated_presets" from "service_role";

revoke update on table "public"."user_generated_presets" from "service_role";

alter table "public"."user_generated_presets" drop constraint "user_generated_presets_uid_key";

alter table "public"."user_information" drop constraint "user_information_flags_check";

alter table "public"."user_generated_presets" drop constraint "user_generated_presets_pkey";

drop index if exists "public"."user_generated_presets_pkey";

drop index if exists "public"."user_generated_presets_uid_key";

drop table "public"."user_generated_presets";

create table "public"."company_presets_preferences" (
    "uid" uuid not null,
    "owner_uid" uuid not null,
    "company_preset" uuid not null,
    "options" jsonb not null default '{}'::jsonb
);


alter table "public"."company_presets_preferences" enable row level security;

alter table "public"."user_information" drop column "flags";

CREATE UNIQUE INDEX user_generated_presets_pkey ON public.company_presets_preferences USING btree (uid);

CREATE UNIQUE INDEX user_generated_presets_uid_key ON public.company_presets_preferences USING btree (uid);

alter table "public"."company_presets_preferences" add constraint "user_generated_presets_pkey" PRIMARY KEY using index "user_generated_presets_pkey";

alter table "public"."company_presets_preferences" add constraint "company_presets_preferences_company_preset_fkey" FOREIGN KEY (company_preset) REFERENCES company_presets(uid) not valid;

alter table "public"."company_presets_preferences" validate constraint "company_presets_preferences_company_preset_fkey";

alter table "public"."company_presets_preferences" add constraint "company_presets_preferences_owner_uid_fkey" FOREIGN KEY (owner_uid) REFERENCES auth.users(id) not valid;

alter table "public"."company_presets_preferences" validate constraint "company_presets_preferences_owner_uid_fkey";

alter table "public"."company_presets_preferences" add constraint "user_generated_presets_uid_key" UNIQUE using index "user_generated_presets_uid_key";

grant delete on table "public"."company_presets_preferences" to "anon";

grant insert on table "public"."company_presets_preferences" to "anon";

grant references on table "public"."company_presets_preferences" to "anon";

grant select on table "public"."company_presets_preferences" to "anon";

grant trigger on table "public"."company_presets_preferences" to "anon";

grant truncate on table "public"."company_presets_preferences" to "anon";

grant update on table "public"."company_presets_preferences" to "anon";

grant delete on table "public"."company_presets_preferences" to "authenticated";

grant insert on table "public"."company_presets_preferences" to "authenticated";

grant references on table "public"."company_presets_preferences" to "authenticated";

grant select on table "public"."company_presets_preferences" to "authenticated";

grant trigger on table "public"."company_presets_preferences" to "authenticated";

grant truncate on table "public"."company_presets_preferences" to "authenticated";

grant update on table "public"."company_presets_preferences" to "authenticated";

grant delete on table "public"."company_presets_preferences" to "service_role";

grant insert on table "public"."company_presets_preferences" to "service_role";

grant references on table "public"."company_presets_preferences" to "service_role";

grant select on table "public"."company_presets_preferences" to "service_role";

grant trigger on table "public"."company_presets_preferences" to "service_role";

grant truncate on table "public"."company_presets_preferences" to "service_role";

grant update on table "public"."company_presets_preferences" to "service_role";