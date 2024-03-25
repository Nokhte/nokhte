alter table "public"."finished_nokhte_sessions" add column "aliases" text[] not null;

create policy "UPDATE: They can only update their row"
on "public"."finished_nokhte_sessions"
as permissive
for update
to authenticated
using ((auth.uid() = ANY (collaborator_uids)))
with check ((auth.uid() = ANY (collaborator_uids)));