drop trigger if exists "forge_the_collaboration" on "public"."p2p_collaborator_pool";

create policy "SELECT: They can read their row"
on "public"."existing_collaborations"
as permissive
for select
to authenticated
using (((auth.uid() = collaborator_one) OR (auth.uid() = collaborator_two)));


create policy "DELETE: They can delete their own row"
on "public"."p2p_collaborator_pool"
as permissive
for delete
to authenticated
using ((auth.uid() = wayfarer_uid));