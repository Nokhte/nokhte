insert into storage.buckets (id, name)
    values  ('nokhte-sessions-audio', 'nokhte-sessions-audio');

create policy "users can delete in nokhte-sessions-audio"
on "storage"."objects"
as permissive
for delete
to authenticated
using ((((bucket_id = 'nokhte-sessions-audio'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))) OR ((bucket_id = 'nokhte-sessions-audio'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text))));


create policy "users can insert in nokhte-sessions-audio"
on "storage"."objects"
as permissive
for insert
to authenticated
with check ((((bucket_id = 'nokhte-sessions-audio'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))) OR ((bucket_id = 'nokhte-sessions-audio'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text))));


create policy "users can select in nokhte-sessions-audio"
on "storage"."objects"
as permissive
for select
to authenticated
using ((((bucket_id = 'nokhte-sessions-audio'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))) OR ((bucket_id = 'nokhte-sessions-audio'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text))));


create policy "users can update in nokhte-sessions-audio "
on "storage"."objects"
as permissive
for update
to authenticated
using ((((bucket_id = 'nokhte-sessions-audio'::text) AND ((split_part((storage.foldername(name))[1], '_'::text, 1) = (auth.uid())::text) OR (split_part((storage.foldername(name))[1], '_'::text, 2) = (auth.uid())::text))) OR ((bucket_id = 'nokhte-sessions-audio'::text) AND ((storage.foldername(name))[1] = (auth.uid())::text))));



