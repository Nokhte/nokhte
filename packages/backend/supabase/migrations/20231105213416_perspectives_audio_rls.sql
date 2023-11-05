drop policy "allows insert root folder that follow name-convens ojhj66_0" on "storage"."objects";

drop policy "allows it all as long as they are a collaborator ojhj66_0" on "storage"."objects";

drop policy "allows it all as long as they are a collaborator ojhj66_1" on "storage"."objects";

drop policy "allows it all as long as they are a collaborator ojhj66_2" on "storage"."objects";

drop policy "allows it all as long as they are a collaborator ojhj66_3" on "storage"."objects";

drop policy "users can CRUD only within their folder tew3gj_0" on "storage"."objects";

drop policy "users can CRUD only within their folder tew3gj_1" on "storage"."objects";

drop policy "users can CRUD only within their folder tew3gj_2" on "storage"."objects";

drop policy "users can CRUD only within their folder tew3gj_3" on "storage"."objects";

drop policy "users can make root level folder (their uid) tew3gj_0" on "storage"."objects";

create policy "they can delete in their own or collaboration folder"
on "storage"."objects"
as permissive
for delete
to authenticated
using ((((bucket_id = 'perspectives_audio'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))) OR ((bucket_id = 'perspectives_audio'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text))));


create policy "users can insert in their own or collaboration folder"
on "storage"."objects"
as permissive
for insert
to authenticated
with check ((((bucket_id = 'perspectives_audio'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))) OR ((bucket_id = 'perspectives_audio'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text))));


create policy "users can select from their folder or collaboration folder"
on "storage"."objects"
as permissive
for select
to authenticated
using ((((bucket_id = 'perspectives_audio'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))) OR ((bucket_id = 'perspectives_audio'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text))));


create policy "users can update their own & collaboration folder"
on "storage"."objects"
as permissive
for update
to authenticated
using ((((bucket_id = 'perspectives_audio'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))) OR ((bucket_id = 'perspectives_audio'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text))));