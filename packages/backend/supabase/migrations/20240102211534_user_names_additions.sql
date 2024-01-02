alter table "public"."user_names" add column "has_gone_through_invitation_flow" boolean not null default false;

alter table "public"."user_names" add column "has_sent_an_invitation" boolean not null default false;

create policy "UPDATE: Users can update their own row"
on "public"."user_names"
as permissive
for update
to authenticated
using ((uid = auth.uid()))
with check (true);