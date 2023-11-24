create policy "DELETE: they can delete their row"
on "public"."existing_collaborations"
as permissive
for delete
to authenticated
using ((auth.uid() = collaborator_one) OR (auth.uid() = collaborator_two));


create policy "They Can Only Delete Scheduling Documents That They Are Co-Authors Of"
on "public"."working_collaborative_scheduling"
as permissive
for delete
to authenticated
using (((auth.uid() = collaborator_one_uid) OR (auth.uid() = collaborator_two_uid)));


create policy "They Can Only Delete Documents They Are Co-Authors Of"
on "public"."working_collaborative_documents"
as permissive
for delete 
to authenticated
using  (((auth.uid() = collaborator_one_uid) OR (auth.uid() = collaborator_two_uid)));

create policy "Can only Delete Timers They Are Collaborators Over"
on "public"."timer_information"
as permissive
for delete
to authenticated
using (((auth.uid() = collaborator_one_uid) OR (auth.uid() = collaborator_two_uid)));

create policy "Only Owners Can Delete Their Solo Docs"
on "public"."solo_sharable_documents"
as permissive
for delete
to authenticated
using ((auth.uid() = owner_uid));