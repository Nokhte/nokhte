drop policy "INSERT: Can Insert a Row where they are a collaborator" on "public"."active_monetization_sessions";

create policy "INSERT: Any Authenticated User Can Insert"
on "public"."active_monetization_sessions"
as permissive
for insert
to authenticated
with check (true);
