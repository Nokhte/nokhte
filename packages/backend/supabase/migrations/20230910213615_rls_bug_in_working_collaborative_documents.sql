alter table "public"."working_collaborative_documents" alter column "content" set default ''::text;

create policy "Enable insert for authenticated users only"
on "public"."working_collaborative_documents"
as permissive
for insert
to authenticated
with check (true);
