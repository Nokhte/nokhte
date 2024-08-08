drop policy "DELETE: Can Delete a row if they are a collaborator" on "public"."active_monetization_sessions";

drop policy "INSERT: Any Authenticated User Can Insert" on "public"."active_monetization_sessions";

drop policy "SELECT: They can read their own row" on "public"."active_monetization_sessions";

drop policy "UPDATE: Can Update Their Own Row" on "public"."active_monetization_sessions";

revoke delete on table "public"."active_monetization_sessions" from "anon";

revoke insert on table "public"."active_monetization_sessions" from "anon";

revoke references on table "public"."active_monetization_sessions" from "anon";

revoke select on table "public"."active_monetization_sessions" from "anon";

revoke trigger on table "public"."active_monetization_sessions" from "anon";

revoke truncate on table "public"."active_monetization_sessions" from "anon";

revoke update on table "public"."active_monetization_sessions" from "anon";

revoke delete on table "public"."active_monetization_sessions" from "authenticated";

revoke insert on table "public"."active_monetization_sessions" from "authenticated";

revoke references on table "public"."active_monetization_sessions" from "authenticated";

revoke select on table "public"."active_monetization_sessions" from "authenticated";

revoke trigger on table "public"."active_monetization_sessions" from "authenticated";

revoke truncate on table "public"."active_monetization_sessions" from "authenticated";

revoke update on table "public"."active_monetization_sessions" from "authenticated";

revoke delete on table "public"."active_monetization_sessions" from "service_role";

revoke insert on table "public"."active_monetization_sessions" from "service_role";

revoke references on table "public"."active_monetization_sessions" from "service_role";

revoke select on table "public"."active_monetization_sessions" from "service_role";

revoke trigger on table "public"."active_monetization_sessions" from "service_role";

revoke truncate on table "public"."active_monetization_sessions" from "service_role";

revoke update on table "public"."active_monetization_sessions" from "service_role";

alter table "public"."active_monetization_sessions" drop constraint "active_monetization_sessions_collaborator_uids_key";

alter table "public"."active_monetization_sessions" drop constraint "active_monetization_sessions_pkey";

drop index if exists "public"."active_monetization_sessions_collaborator_uids_key";

drop index if exists "public"."active_monetization_sessions_pkey";

drop table "public"."active_monetization_sessions";



drop policy "UPDATE: They can update their row if is a valid session" on "public"."rt_active_nokhte_sessions";

drop policy "UPDATE: Can update valid rows" on "public"."st_active_nokhte_sessions";

alter table "public"."st_active_nokhte_sessions" drop column "has_premium_access";

create policy "UPDATE: They can update their row if is a valid session"
on "public"."rt_active_nokhte_sessions"
as permissive
for update
to authenticated
using ((EXISTS ( SELECT st_active_nokhte_sessions.collaborator_uids
   FROM st_active_nokhte_sessions
  WHERE ((auth.uid() = ANY (st_active_nokhte_sessions.collaborator_uids)) AND (rt_active_nokhte_sessions.session_uid = st_active_nokhte_sessions.session_uid) AND ((array_length(st_active_nokhte_sessions.collaborator_uids, 1) < 4) OR (EXISTS ( SELECT 1
           FROM user_metadata metadata
          WHERE (((auth.uid() = metadata.uid) AND (metadata.has_used_trial = false)) OR (metadata.is_subscribed = true) OR (metadata.is_whitelisted = true)))))))))
with check (true);


create policy "UPDATE: Can update valid rows"
on "public"."st_active_nokhte_sessions"
as permissive
for update
to authenticated
using ((((auth.uid() = ANY (collaborator_uids)) AND (array_length(collaborator_uids, 1) < 4)) OR (EXISTS ( SELECT 1
   FROM user_metadata metadata
  WHERE (((auth.uid() = metadata.uid) AND (metadata.has_used_trial = false)) OR (metadata.is_subscribed = true) OR (metadata.is_whitelisted = true))))))
with check (true);


