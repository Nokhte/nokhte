create policy "UPDATE: They can only update their row "
on "public"."existing_collaborations"
as permissive
for update
to authenticated
with check (((auth.uid() = collaborator_one) OR (auth.uid() = collaborator_two)));

alter table "public"."existing_collaborations" alter column "is_currently_active" set default true;