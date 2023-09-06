drop policy "READ: Can Only Read Documents That They Are Co-Authors Of" on "public"."working_collaborative_p2p_purpose_documents";

drop policy "They Can Only Update Their Own Document" on "public"."working_collaborative_p2p_purpose_documents";

create policy "Enable insert for authenticated users only"
on "public"."finished_collaborative_p2p_purpose_documents"
as permissive
for insert
to authenticated
with check (true);


create policy "Users can only read their past commited"
on "public"."finished_collaborative_p2p_purpose_documents"
as permissive
for select
to authenticated
using (((auth.uid() = collaborator_one_uid) OR (auth.uid() = collaborator_two_uid)));


create policy "Can Only Read Documents That They Are Co-Authors Of"
on "public"."working_collaborative_p2p_purpose_documents"
as permissive
for select
to authenticated
using (((auth.uid() = collaborator_one_uid) OR (auth.uid() = collaborator_two_uid)));


create policy "They Can Only Update Documents That They Are Co-Authors Of"
on "public"."working_collaborative_p2p_purpose_documents"
as permissive
for update
to authenticated
using (((auth.uid() = collaborator_one_uid) OR (auth.uid() = collaborator_two_uid)));