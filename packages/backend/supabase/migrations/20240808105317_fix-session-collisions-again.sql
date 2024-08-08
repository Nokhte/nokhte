drop policy "SELECT: They can read their own row" on "public"."rt_active_nokhte_sessions";

drop policy "UPDATE: They can update their row if is a valid session" on "public"."rt_active_nokhte_sessions";

create policy "SELECT: They can read their own row"
on "public"."rt_active_nokhte_sessions"
as permissive
for select
to authenticated
using ((EXISTS ( SELECT st_active_nokhte_sessions.collaborator_uids
   FROM st_active_nokhte_sessions
  WHERE (rt_active_nokhte_sessions.session_uid = st_active_nokhte_sessions.session_uid))));


create policy "UPDATE: They can update their row if is a valid session"
on "public"."rt_active_nokhte_sessions"
as permissive
for update
to authenticated
using ((EXISTS ( SELECT st_active_nokhte_sessions.collaborator_uids
   FROM st_active_nokhte_sessions
  WHERE (rt_active_nokhte_sessions.session_uid = st_active_nokhte_sessions.session_uid))))
with check (true);