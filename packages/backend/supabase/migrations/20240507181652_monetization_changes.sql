drop policy "CREATE: Users Who Don't Have a Row Already Can Add Theirs" on "public"."user_names";

drop policy "Can Read: If Is An Authorized Viewer Or Owner" on "public"."user_names";

drop policy "UPDATE: Users can update their own row" on "public"."user_names";

revoke delete on table "public"."user_names" from "anon";

revoke insert on table "public"."user_names" from "anon";

revoke references on table "public"."user_names" from "anon";

revoke select on table "public"."user_names" from "anon";

revoke trigger on table "public"."user_names" from "anon";

revoke truncate on table "public"."user_names" from "anon";

revoke update on table "public"."user_names" from "anon";

revoke delete on table "public"."user_names" from "authenticated";

revoke insert on table "public"."user_names" from "authenticated";

revoke references on table "public"."user_names" from "authenticated";

revoke select on table "public"."user_names" from "authenticated";

revoke trigger on table "public"."user_names" from "authenticated";

revoke truncate on table "public"."user_names" from "authenticated";

revoke update on table "public"."user_names" from "authenticated";

revoke delete on table "public"."user_names" from "service_role";

revoke insert on table "public"."user_names" from "service_role";

revoke references on table "public"."user_names" from "service_role";

revoke select on table "public"."user_names" from "service_role";

revoke trigger on table "public"."user_names" from "service_role";

revoke truncate on table "public"."user_names" from "service_role";

revoke update on table "public"."user_names" from "service_role";

alter table "public"."user_names" drop constraint "user_names_uid_fkey";

alter table "public"."user_names" drop constraint "usernames_uid_key";

alter table "public"."user_names" drop constraint "usernames_pkey";

drop index if exists "public"."usernames_pkey";

drop index if exists "public"."usernames_uid_key";


create table "public"."user_information" (
    "uid" uuid not null,
    "first_name" text,
    "last_name" text,
    "has_gone_through_invitation_flow" boolean not null default false,
    "has_sent_an_invitation" boolean not null default false,
    "wants_to_repeat_invitation_flow" boolean not null default false,
    "authorized_viewers" uuid[] not null default '{}'::uuid[],
    "has_entered_storage" boolean not null default false
);

INSERT INTO "public"."user_information" SELECT * FROM "public"."user_names";

drop table "public"."user_names";

alter table "public"."user_information" enable row level security;

CREATE UNIQUE INDEX usernames_pkey ON public.user_information USING btree (uid);

CREATE UNIQUE INDEX usernames_uid_key ON public.user_information USING btree (uid);

alter table "public"."user_information" add constraint "usernames_pkey" PRIMARY KEY using index "usernames_pkey";

alter table "public"."user_information" add constraint "user_information_uid_fkey" FOREIGN KEY (uid) REFERENCES auth.users(id) not valid;

alter table "public"."user_information" validate constraint "user_information_uid_fkey";

alter table "public"."user_information" add constraint "usernames_uid_key" UNIQUE using index "usernames_uid_key";

grant delete on table "public"."user_information" to "anon";

grant insert on table "public"."user_information" to "anon";

grant references on table "public"."user_information" to "anon";

grant select on table "public"."user_information" to "anon";

grant trigger on table "public"."user_information" to "anon";

grant truncate on table "public"."user_information" to "anon";

grant update on table "public"."user_information" to "anon";

grant delete on table "public"."user_information" to "authenticated";

grant insert on table "public"."user_information" to "authenticated";

grant references on table "public"."user_information" to "authenticated";

grant select on table "public"."user_information" to "authenticated";

grant trigger on table "public"."user_information" to "authenticated";

grant truncate on table "public"."user_information" to "authenticated";

grant update on table "public"."user_information" to "authenticated";

grant delete on table "public"."user_information" to "service_role";

grant insert on table "public"."user_information" to "service_role";

grant references on table "public"."user_information" to "service_role";

grant select on table "public"."user_information" to "service_role";

grant trigger on table "public"."user_information" to "service_role";

grant truncate on table "public"."user_information" to "service_role";

grant update on table "public"."user_information" to "service_role";

create policy "CREATE: Users Who Don't Have a Row Already Can Add Theirs"
on "public"."user_information"
as permissive
for insert
to authenticated
with check ((NOT (EXISTS ( SELECT 1
   FROM user_information usernames_1
  WHERE (auth.uid() = usernames_1.uid)))));


create policy "Can Read: If Is An Authorized Viewer Or Owner"
on "public"."user_information"
as permissive
for select
to authenticated
using (((uid = auth.uid()) OR (auth.uid() = ANY (authorized_viewers))));


create policy "UPDATE: Users can update their own row"
on "public"."user_information"
as permissive
for update
to authenticated
using ((uid = auth.uid()))
with check (true);


create table "public"."collaborator_pool" (
    "id" bigint generated by default as identity not null,
    "wayfarer_uid" uuid not null,
    "matched_uid" uuid,
    "query_uid" uuid not null,
    "invitation_type" invitation_type not null default 'NOKHTE_SESSION'::invitation_type
);

INSERT INTO "public"."collaborator_pool" SELECT * FROM "public"."p2p_collaborator_pool";

drop table "public"."p2p_collaborator_pool";




alter table "public"."collaborator_pool" enable row level security;

CREATE UNIQUE INDEX p2p_collaborator_pool_pkey ON public.collaborator_pool USING btree (id);

CREATE UNIQUE INDEX p2p_collaborator_pool_wayfarer_uid_key ON public.collaborator_pool USING btree (wayfarer_uid);

alter table "public"."collaborator_pool" add constraint "p2p_collaborator_pool_pkey" PRIMARY KEY using index "p2p_collaborator_pool_pkey";

alter table "public"."collaborator_pool" add constraint "collaborator_pool_matched_uid_fkey" FOREIGN KEY (matched_uid) REFERENCES auth.users(id) not valid;

alter table "public"."collaborator_pool" validate constraint "collaborator_pool_matched_uid_fkey";

alter table "public"."collaborator_pool" add constraint "collaborator_pool_query_uid_fkey" FOREIGN KEY (query_uid) REFERENCES auth.users(id) not valid;

alter table "public"."collaborator_pool" validate constraint "collaborator_pool_query_uid_fkey";

alter table "public"."collaborator_pool" add constraint "collaborator_pool_wayfarer_uid_fkey" FOREIGN KEY (wayfarer_uid) REFERENCES auth.users(id) not valid;

alter table "public"."collaborator_pool" validate constraint "collaborator_pool_wayfarer_uid_fkey";

alter table "public"."collaborator_pool" add constraint "p2p_collaborator_pool_wayfarer_uid_key" UNIQUE using index "p2p_collaborator_pool_wayfarer_uid_key";

grant delete on table "public"."collaborator_pool" to "anon";

grant insert on table "public"."collaborator_pool" to "anon";

grant references on table "public"."collaborator_pool" to "anon";

grant select on table "public"."collaborator_pool" to "anon";

grant trigger on table "public"."collaborator_pool" to "anon";

grant truncate on table "public"."collaborator_pool" to "anon";

grant update on table "public"."collaborator_pool" to "anon";

grant delete on table "public"."collaborator_pool" to "authenticated";

grant insert on table "public"."collaborator_pool" to "authenticated";

grant references on table "public"."collaborator_pool" to "authenticated";

grant select on table "public"."collaborator_pool" to "authenticated";

grant trigger on table "public"."collaborator_pool" to "authenticated";

grant truncate on table "public"."collaborator_pool" to "authenticated";

grant update on table "public"."collaborator_pool" to "authenticated";

grant delete on table "public"."collaborator_pool" to "service_role";

grant insert on table "public"."collaborator_pool" to "service_role";

grant references on table "public"."collaborator_pool" to "service_role";

grant select on table "public"."collaborator_pool" to "service_role";

grant trigger on table "public"."collaborator_pool" to "service_role";

grant truncate on table "public"."collaborator_pool" to "service_role";

grant update on table "public"."collaborator_pool" to "service_role";

create policy "DELETE: They can delete their own row"
on "public"."collaborator_pool"
as permissive
for delete
to authenticated
using ((auth.uid() = wayfarer_uid));

CREATE TABLE "public"."active_nokhte_sessions" AS SELECT * FROM "public"."active_irl_nokhte_sessions";


alter
  publication supabase_realtime add table public.active_nokhte_sessions;

drop policy "DELETE: they can delete their row" on "public"."active_irl_nokhte_sessions";

drop policy "SELECT: They can read their row" on "public"."active_irl_nokhte_sessions";

drop policy "UPDATE: They can only update their row" on "public"."active_irl_nokhte_sessions";

revoke delete on table "public"."active_irl_nokhte_sessions" from "anon";

revoke insert on table "public"."active_irl_nokhte_sessions" from "anon";

revoke references on table "public"."active_irl_nokhte_sessions" from "anon";

revoke select on table "public"."active_irl_nokhte_sessions" from "anon";

revoke trigger on table "public"."active_irl_nokhte_sessions" from "anon";

revoke truncate on table "public"."active_irl_nokhte_sessions" from "anon";

revoke update on table "public"."active_irl_nokhte_sessions" from "anon";

revoke delete on table "public"."active_irl_nokhte_sessions" from "authenticated";

revoke insert on table "public"."active_irl_nokhte_sessions" from "authenticated";

revoke references on table "public"."active_irl_nokhte_sessions" from "authenticated";

revoke select on table "public"."active_irl_nokhte_sessions" from "authenticated";

revoke trigger on table "public"."active_irl_nokhte_sessions" from "authenticated";

revoke truncate on table "public"."active_irl_nokhte_sessions" from "authenticated";

revoke update on table "public"."active_irl_nokhte_sessions" from "authenticated";

revoke delete on table "public"."active_irl_nokhte_sessions" from "service_role";

revoke insert on table "public"."active_irl_nokhte_sessions" from "service_role";

revoke references on table "public"."active_irl_nokhte_sessions" from "service_role";

revoke select on table "public"."active_irl_nokhte_sessions" from "service_role";

revoke trigger on table "public"."active_irl_nokhte_sessions" from "service_role";

revoke truncate on table "public"."active_irl_nokhte_sessions" from "service_role";

revoke update on table "public"."active_irl_nokhte_sessions" from "service_role";

alter table "public"."active_irl_nokhte_sessions" drop constraint "active_irl_nokhte_sessions_leader_uid_fkey";

alter table "public"."active_irl_nokhte_sessions" drop constraint "active_irl_nokhte_sessions_session_uid_key";

alter table "public"."active_irl_nokhte_sessions" drop constraint "active_irl_nokhte_sessions_speaker_spotlight_fkey";

alter table "public"."active_irl_nokhte_sessions" drop constraint "active_nokhte_sessions_collaborator_uids_key";

alter table "public"."active_irl_nokhte_sessions" drop constraint "nokhte_sessions_pkey";

drop index if exists "public"."active_irl_nokhte_sessions_session_uid_key";

drop index if exists "public"."active_nokhte_sessions_collaborator_uids_key";

drop index if exists "public"."nokhte_sessions_pkey";

drop table "public"."active_irl_nokhte_sessions";


alter table "public"."active_nokhte_sessions" enable row level security;

CREATE UNIQUE INDEX active_irl_nokhte_sessions_session_uid_key ON public.active_nokhte_sessions USING btree (session_uid);

CREATE UNIQUE INDEX active_nokhte_sessions_collaborator_uids_key ON public.active_nokhte_sessions USING btree (collaborator_uids);

CREATE UNIQUE INDEX nokhte_sessions_pkey ON public.active_nokhte_sessions USING btree (id);

alter table "public"."active_nokhte_sessions" add constraint "nokhte_sessions_pkey" PRIMARY KEY using index "nokhte_sessions_pkey";

alter table "public"."active_nokhte_sessions" add constraint "active_irl_nokhte_sessions_session_uid_key" UNIQUE using index "active_irl_nokhte_sessions_session_uid_key";

alter table "public"."active_nokhte_sessions" add constraint "active_nokhte_sessions_collaborator_uids_key" UNIQUE using index "active_nokhte_sessions_collaborator_uids_key";

alter table "public"."active_nokhte_sessions" add constraint "active_nokhte_sessions_leader_uid_fkey" FOREIGN KEY (leader_uid) REFERENCES auth.users(id) not valid;

alter table "public"."active_nokhte_sessions" validate constraint "active_nokhte_sessions_leader_uid_fkey";

alter table "public"."active_nokhte_sessions" add constraint "active_nokhte_sessions_speaker_spotlight_fkey" FOREIGN KEY (speaker_spotlight) REFERENCES auth.users(id) not valid;

alter table "public"."active_nokhte_sessions" validate constraint "active_nokhte_sessions_speaker_spotlight_fkey";

grant delete on table "public"."active_nokhte_sessions" to "anon";

grant insert on table "public"."active_nokhte_sessions" to "anon";

grant references on table "public"."active_nokhte_sessions" to "anon";

grant select on table "public"."active_nokhte_sessions" to "anon";

grant trigger on table "public"."active_nokhte_sessions" to "anon";

grant truncate on table "public"."active_nokhte_sessions" to "anon";

grant update on table "public"."active_nokhte_sessions" to "anon";

grant delete on table "public"."active_nokhte_sessions" to "authenticated";

grant insert on table "public"."active_nokhte_sessions" to "authenticated";

grant references on table "public"."active_nokhte_sessions" to "authenticated";

grant select on table "public"."active_nokhte_sessions" to "authenticated";

grant trigger on table "public"."active_nokhte_sessions" to "authenticated";

grant truncate on table "public"."active_nokhte_sessions" to "authenticated";

grant update on table "public"."active_nokhte_sessions" to "authenticated";

grant delete on table "public"."active_nokhte_sessions" to "service_role";

grant insert on table "public"."active_nokhte_sessions" to "service_role";

grant references on table "public"."active_nokhte_sessions" to "service_role";

grant select on table "public"."active_nokhte_sessions" to "service_role";

grant trigger on table "public"."active_nokhte_sessions" to "service_role";

grant truncate on table "public"."active_nokhte_sessions" to "service_role";

grant update on table "public"."active_nokhte_sessions" to "service_role";

create policy "DELETE: they can delete their row"
on "public"."active_nokhte_sessions"
as permissive
for delete
to authenticated
using ((auth.uid() = ANY (collaborator_uids)));


create policy "SELECT: They can read their row"
on "public"."active_nokhte_sessions"
as permissive
for select
to authenticated
using ((auth.uid() = ANY (collaborator_uids)));


create policy "UPDATE: They can only update their row"
on "public"."active_nokhte_sessions"
as permissive
for update
to authenticated
using ((auth.uid() = ANY (collaborator_uids)))
with check ((auth.uid() = ANY (collaborator_uids)));

create table "public"."user_metadata" (
    "uid" uuid not null default auth.uid(),
    "has_used_trial" boolean not null default false
);

alter table "public"."active_nokhte_sessions" alter column "collaborator_uids" set not null;

alter table "public"."active_nokhte_sessions" alter column "content" set default '{}'::text[];

alter table "public"."active_nokhte_sessions" alter column "content" set not null;

alter table "public"."active_nokhte_sessions" alter column "created_at" set default now();

alter table "public"."active_nokhte_sessions" alter column "created_at" set not null;

alter table "public"."active_nokhte_sessions" alter column "current_phases" set default '{0,0}'::real[];

alter table "public"."active_nokhte_sessions" alter column "current_phases" set not null;

alter table "public"."active_nokhte_sessions" alter column "has_begun" set default false;

alter table "public"."active_nokhte_sessions" alter column "has_begun" set not null;

alter table "public"."active_nokhte_sessions" alter column "have_gyroscopes" set default '{t,t}'::boolean[];

alter table "public"."active_nokhte_sessions" alter column "have_gyroscopes" set not null;

alter table "public"."active_nokhte_sessions" alter column "id" add generated by default as identity;

alter table "public"."active_nokhte_sessions" alter column "is_online" set default '{t,t}'::boolean[];

alter table "public"."active_nokhte_sessions" alter column "is_online" set not null;

alter table "public"."active_nokhte_sessions" alter column "leader_uid" set not null;

alter table "public"."active_nokhte_sessions" alter column "session_uid" set default gen_random_uuid();

alter table "public"."active_nokhte_sessions" alter column "session_uid" set not null;

alter table "public"."user_metadata" enable row level security;

CREATE UNIQUE INDEX user_metadata_pkey ON public.user_metadata USING btree (uid);

alter table "public"."user_metadata" add constraint "user_metadata_pkey" PRIMARY KEY using index "user_metadata_pkey";

create policy "READ: Their Own Row"
on "public"."user_metadata"
as permissive
for select
to authenticated
using ((uid = auth.uid()));

alter table "public"."user_metadata" add column "is_subscribed" boolean not null default false;

drop policy "UPDATE: They can only update their row" on "public"."active_nokhte_sessions";

alter table "public"."user_metadata" add column "subscriber_id" text not null default ''::text;

create policy "UPDATE: They can only update their row"
on "public"."active_nokhte_sessions"
as permissive
for update
to authenticated
using (true)
with check ((((array_length(collaborator_uids, 1) <= 3) AND (auth.uid() = ANY (collaborator_uids))) OR ((array_length(collaborator_uids, 1) > 3) AND (auth.uid() = ANY (collaborator_uids)) AND (EXISTS ( SELECT 1
   FROM user_metadata user_metadata_1
  WHERE ((auth.uid() = user_metadata_1.uid) AND ((user_metadata_1.is_subscribed = true) OR (user_metadata_1.has_used_trial = false))))))));


CREATE UNIQUE INDEX user_metadata_subscriber_id_key ON public.user_metadata USING btree (subscriber_id);

alter table "public"."user_metadata" add constraint "user_metadata_subscriber_id_key" UNIQUE using index "user_metadata_subscriber_id_key";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.update_nokhte_session_phase(incoming_uids uuid[], index_to_edit integer, new_value real)
 RETURNS void
 LANGUAGE plpgsql
AS $function$BEGIN
    update public.active_nokhte_sessions SET current_phases[index_to_edit+1] = new_value WHERE collaborator_uids = incoming_uids;
END;$function$
;


drop policy "UPDATE: They can only update their row" on "public"."active_nokhte_sessions";

GRANT EXECUTE ON FUNCTION public.update_nokhte_session_phase TO service_role;

REVOKE EXECUTE ON FUNCTION public.update_nokhte_session_phase FROM authenticated, anon;

drop policy "Enable insert for authenticated users" on "public"."finished_nokhte_sessions";

alter table "public"."user_information" drop column "wants_to_repeat_invitation_flow";