drop policy "READ: People Can Only Read Their Own Row" on "public"."user_names";

drop policy "DELETE: they can delete their row" on "public"."active_nokhte_sessions";

drop policy "SELECT: They can read their row" on "public"."active_nokhte_sessions";

drop policy "UPDATE: They can only update their row" on "public"."active_nokhte_sessions";

drop policy "SELECT: Users can read their past Nokhte Sessions" on "public"."finished_nokhte_sessions";

alter table "public"."active_nokhte_sessions" drop constraint "active_nokhte_sessions_collaborator_one_uid_fkey";

alter table "public"."active_nokhte_sessions" drop constraint "active_nokhte_sessions_collaborator_two_uid_fkey";

alter table "public"."finished_nokhte_sessions" drop constraint "finished_nokhte_sessions_collaborator_one_uid_fkey";

alter table "public"."finished_nokhte_sessions" drop constraint "finished_nokhte_sessions_collaborator_two_uid_fkey";

alter table "public"."active_nokhte_sessions" drop column "collaborator_one_uid";

alter table "public"."active_nokhte_sessions" drop column "collaborator_two_uid";

alter table "public"."active_nokhte_sessions" add column "collaborator_uids" uuid[] not null;

alter table "public"."finished_nokhte_sessions" drop column "collaborator_one_uid";

alter table "public"."finished_nokhte_sessions" drop column "collaborator_two_uid";

alter table "public"."finished_nokhte_sessions" add column "collaborator_uids" uuid[] not null;

alter table "public"."user_names" add column "authorized_viewers" uuid[] not null default '{}'::uuid[];

CREATE UNIQUE INDEX active_nokhte_sessions_collaborator_uids_key ON public.active_nokhte_sessions USING btree (collaborator_uids);

alter table "public"."active_nokhte_sessions" add constraint "active_nokhte_sessions_collaborator_uids_key" UNIQUE using index "active_nokhte_sessions_collaborator_uids_key";

create policy "Can Read: If Is An Authorized Viewer Or Owner"
on "public"."user_names"
as permissive
for select
to authenticated
using (((uid = auth.uid()) OR (auth.uid() = ANY (authorized_viewers))));


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


create policy "SELECT: Users can read their past Nokhte Sessions"
on "public"."finished_nokhte_sessions"
as permissive
for select
to authenticated
using ((auth.uid() = ANY (collaborator_uids)));