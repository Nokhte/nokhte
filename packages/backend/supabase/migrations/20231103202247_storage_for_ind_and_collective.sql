alter table "storage"."objects" add constraint "objects_owner_fkey" FOREIGN KEY (owner) REFERENCES auth.users(id) not valid;

alter table "storage"."objects" validate constraint "objects_owner_fkey";

create policy "allows insert root folder that follow name-convens ojhj66_0"
on "storage"."objects"
as permissive
for insert
to authenticated
with check (((( SELECT count(*) AS count
   FROM storage.objects objects_1
  WHERE ((objects_1.bucket_id = 'collective_sessions'::text) AND ((storage.foldername(objects_1.name))[1] = (auth.uid())::text))) = 0) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text)) AND (array_length(storage.foldername(name), 1) = 1)));


create policy "allows it all as long as they are a collaborator ojhj66_0"
on "storage"."objects"
as permissive
for select
to authenticated
using (((bucket_id = 'collective_sessions'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))));


create policy "allows it all as long as they are a collaborator ojhj66_1"
on "storage"."objects"
as permissive
for insert
to authenticated
with check (((bucket_id = 'collective_sessions'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))));


create policy "allows it all as long as they are a collaborator ojhj66_2"
on "storage"."objects"
as permissive
for update
to authenticated
using (((bucket_id = 'collective_sessions'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))));


create policy "allows it all as long as they are a collaborator ojhj66_3"
on "storage"."objects"
as permissive
for delete
to authenticated
using (((bucket_id = 'collective_sessions'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))));


create policy "users can CRUD only within their folder tew3gj_0"
on "storage"."objects"
as permissive
for insert
to authenticated
with check (((bucket_id = 'individual_sessions'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


create policy "users can CRUD only within their folder tew3gj_1"
on "storage"."objects"
as permissive
for update
to authenticated
using (((bucket_id = 'individual_sessions'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


create policy "users can CRUD only within their folder tew3gj_2"
on "storage"."objects"
as permissive
for delete
to authenticated
using (((bucket_id = 'individual_sessions'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


create policy "users can CRUD only within their folder tew3gj_3"
on "storage"."objects"
as permissive
for select
to authenticated
using (((bucket_id = 'individual_sessions'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text)));


create policy "users can make root level folder (their uid) tew3gj_0"
on "storage"."objects"
as permissive
for insert
to authenticated
with check (((( SELECT count(*) AS count
   FROM storage.objects objects_1
  WHERE ((objects_1.bucket_id = 'individual_sessions'::text) AND ((storage.foldername(objects_1.name))[1] = (auth.uid())::text))) = 0) AND ((storage.foldername(name))[1] = (auth.uid())::text) AND (array_length(storage.foldername(name), 1) = 1)));