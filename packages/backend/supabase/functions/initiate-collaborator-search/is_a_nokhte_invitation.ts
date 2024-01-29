// deno-lint-ignore-file no-explicit-any
import { supabaseAdmin } from "../constants/supabase.ts";
import { isEmptyOrNull, isNotEmptyOrNull } from "../utils/array_utils.ts";

async function isANokhteInvitation(queryUID: string, mostRecentEntrant: any) {
  const wayfarerQueryRes = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .select()
    .eq("query_uid", queryUID)
    .eq("invitation_type", "NOKHTE_SESSION");

  if (isNotEmptyOrNull(wayfarerQueryRes?.data)) {
    const matchedUID = wayfarerQueryRes.data?.[0]?.["wayfarer_uid"];
    const userUID = mostRecentEntrant.data?.[0]["wayfarer_uid"];
    const meetingUID = mostRecentEntrant.data?.[0]["query_uid"];

    const checkRes = await supabaseAdmin
      .from("active_nokhte_sessions")
      .select()
      .eq("meeting_uid", meetingUID);

    if (isEmptyOrNull(checkRes?.data)) {
      await supabaseAdmin.from("active_nokhte_sessions").insert({
        collaborator_one_uid: userUID,
        collaborator_two_uid: matchedUID,
        meeting_uid: meetingUID,
      });
      await supabaseAdmin
        .from("p2p_collaborator_pool")
        .delete()
        .eq("wayfarer_uid", userUID);
      await supabaseAdmin
        .from("p2p_collaborator_pool")
        .delete()
        .eq("wayfarer_uid", matchedUID);
    }
  }
}

export { isANokhteInvitation };
