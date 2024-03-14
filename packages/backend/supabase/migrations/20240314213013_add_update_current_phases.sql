set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.update_nokhte_session_phase(incoming_uids uuid[], index_to_edit integer, new_value real)
 RETURNS void
 LANGUAGE plpgsql
AS $function$BEGIN
    update public.active_irl_nokhte_sessions SET current_phases[index_to_edit+1] = new_value WHERE collaborator_uids = incoming_uids;
END;$function$
;