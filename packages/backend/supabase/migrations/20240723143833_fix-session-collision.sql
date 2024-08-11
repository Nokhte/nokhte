drop policy "SELECT: They can read their own row" on "public"."rt_active_nokhte_sessions";

drop policy "UPDATE: They can update their row if is a valid session" on "public"."rt_active_nokhte_sessions";

create policy "SELECT: They can read their own row"
on "public"."rt_active_nokhte_sessions"
as permissive
for select
to authenticated
using ((EXISTS ( SELECT st_active_nokhte_sessions.collaborator_uids
   FROM st_active_nokhte_sessions
  WHERE ((auth.uid() = ANY (st_active_nokhte_sessions.collaborator_uids)) AND (rt_active_nokhte_sessions.session_uid = st_active_nokhte_sessions.session_uid)))));


create policy "UPDATE: They can update their row if is a valid session"
on "public"."rt_active_nokhte_sessions"
as permissive
for update
to authenticated
using ((EXISTS ( SELECT st_active_nokhte_sessions.collaborator_uids
   FROM st_active_nokhte_sessions
  WHERE ((auth.uid() = ANY (st_active_nokhte_sessions.collaborator_uids)) AND (rt_active_nokhte_sessions.session_uid = st_active_nokhte_sessions.session_uid) AND ((array_length(st_active_nokhte_sessions.collaborator_uids, 1) < 4) OR (true = ALL (st_active_nokhte_sessions.has_premium_access)))))))
with check ((EXISTS ( SELECT st_active_nokhte_sessions.collaborator_uids
   FROM st_active_nokhte_sessions
  WHERE ((auth.uid() = ANY (st_active_nokhte_sessions.collaborator_uids)) AND (rt_active_nokhte_sessions.session_uid = st_active_nokhte_sessions.session_uid) AND ((array_length(st_active_nokhte_sessions.collaborator_uids, 1) < 4) OR (true = ALL (st_active_nokhte_sessions.has_premium_access)))))));