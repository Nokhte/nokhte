drop policy "UPDATE: Can update a valid session" on "public"."active_nokhte_sessions";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.is_not_updating_has_premium_access(_id bigint, _has_premium_access boolean[])
 RETURNS boolean
 LANGUAGE sql
 SECURITY DEFINER
AS $function$
WITH original_row AS (
    SELECT has_premium_access
    FROM public.active_nokhte_sessions
    WHERE id = _id
)
SELECT (SELECT has_premium_access FROM original_row) = _has_premium_access;
$function$
;

create policy "UPDATE: Can update a valid session"
on "public"."active_nokhte_sessions"
as permissive
for update
to authenticated
using (((auth.uid() = ANY (collaborator_uids)) AND ((array_length(collaborator_uids, 1) < 4) OR (true = ALL (has_premium_access))) AND is_not_updating_has_premium_access(id, has_premium_access)))
with check (((auth.uid() = ANY (collaborator_uids)) AND ((array_length(collaborator_uids, 1) < 4) OR (true = ALL (has_premium_access))) AND is_not_updating_has_premium_access(id, has_premium_access)));