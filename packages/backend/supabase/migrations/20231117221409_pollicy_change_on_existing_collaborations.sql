drop policy "UPDATE: They can only update their row " on "public"."existing_collaborations";

create policy "UPDATE: They can only update their row "
on "public"."existing_collaborations"
as permissive
for update
to authenticated
using (((auth.uid() = collaborator_one) OR (auth.uid() = collaborator_two)))
with check (((auth.uid() = collaborator_one) OR (auth.uid() = collaborator_two)));