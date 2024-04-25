// deno-lint-ignore-file no-explicit-any
import { supabaseAdmin } from "../constants/supabase.ts";
import { isEmptyOrNull, isNotEmptyOrNull } from "../utils/array_utils.ts";
import { updateAuthorizedViewers } from "./update_authorized_viewers.ts";

async function isANokhteInvitation(queryUID: string, mostRecentEntrant: any) {
  const userUID = mostRecentEntrant.data?.[0]["wayfarer_uid"];
  const leaderUID = mostRecentEntrant.data?.[0]["query_uid"];
  const wayfarerQueryRes = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .select()
    .eq("query_uid", queryUID)
    .neq("wayfarer_uid", userUID)
    .eq("invitation_type", "NOKHTE_SESSION");

  if (isNotEmptyOrNull(wayfarerQueryRes?.data)) {
    const matchedUID = wayfarerQueryRes.data?.[0]?.["wayfarer_uid"];
    const checkRes = await supabaseAdmin
      .from("active_irl_nokhte_sessions")
      .select()
      .eq("leader_uid", leaderUID);

    if (isEmptyOrNull(checkRes?.data)) {
      const checkForExistingSessionsRes = await supabaseAdmin
        .from("finished_nokhte_sessions")
        .select()
        .or(
          `collaboration_id.eq.${userUID}_${matchedUID},collaboration_id.eq.${matchedUID}_${userUID}`
        );
      if (isEmptyOrNull(checkForExistingSessionsRes?.data)) {
        await updateAuthorizedViewers(matchedUID, userUID);
        const uids = [matchedUID, userUID];
        uids.sort();
        await supabaseAdmin.from("active_irl_nokhte_sessions").insert({
          collaborator_uids: uids,
          leader_uid: queryUID,
        });
      } else {
        await supabaseAdmin.from("active_irl_nokhte_sessions").insert({
          collaboration_uids:
            checkForExistingSessionsRes.data?.[0]["collaborator_uids"],
        });
      }
      await supabaseAdmin
        .from("p2p_collaborator_pool")
        .delete()
        .eq("wayfarer_uid", userUID);
      await supabaseAdmin
        .from("p2p_collaborator_pool")
        .delete()
        .eq("wayfarer_uid", matchedUID);
    }
  } else {
    const existingNokhteSessionRes = await supabaseAdmin
      .from("active_irl_nokhte_sessions")
      .select()
      .eq("leader_uid", queryUID)
      .eq("has_begun", false);
    if (isNotEmptyOrNull(existingNokhteSessionRes?.data)) {
      const currentCollaboratorUIDs =
        existingNokhteSessionRes.data?.[0]["collaborator_uids"];
      currentCollaboratorUIDs.push(userUID);
      const currentIsOnlineArr =
        existingNokhteSessionRes.data?.[0]["is_online"];
      currentIsOnlineArr.push(true);
      const currentPhasesArr =
        existingNokhteSessionRes.data?.[0]["current_phases"];
      currentPhasesArr.push(0);
      const currentHaveGyroscopesRes =
        existingNokhteSessionRes.data?.[0]["have_gyroscopes"];
      currentHaveGyroscopesRes.push(true);
      await supabaseAdmin
        .from("active_irl_nokhte_sessions")
        .update({
          collaborator_uids: currentCollaboratorUIDs,
          is_online: currentIsOnlineArr,
          current_phases: currentPhasesArr,
          have_gyroscopes: currentHaveGyroscopesRes,
        })
        .eq("leader_uid", queryUID);

      await supabaseAdmin
        .from("p2p_collaborator_pool")
        .delete()
        .eq("wayfarer_uid", userUID);
    }
  }
}

export { isANokhteInvitation };
