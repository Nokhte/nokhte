drop policy "UPDATE: They can update their row if is a valid session" on "public"."rt_active_nokhte_sessions";

drop policy "UPDATE: Can update valid rows" on "public"."st_active_nokhte_sessions";

create policy "UPDATE: They can update their row if is a valid session"
on "public"."rt_active_nokhte_sessions"
as permissive
for update
to authenticated
using ((EXISTS ( SELECT st_active_nokhte_sessions.collaborator_uids
   FROM st_active_nokhte_sessions
  WHERE ((auth.uid() = ANY (st_active_nokhte_sessions.collaborator_uids)) AND (rt_active_nokhte_sessions.session_uid = st_active_nokhte_sessions.session_uid)))))
with check (true);


create policy "UPDATE: Can update valid rows"
on "public"."st_active_nokhte_sessions"
as permissive
for update
to authenticated
using ((auth.uid() = ANY (collaborator_uids)))
with check (true);
