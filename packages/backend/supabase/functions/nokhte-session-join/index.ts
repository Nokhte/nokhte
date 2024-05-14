import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";
import { isNotEmptyOrNull } from "../utils/array_utils.ts";
import { checkIfIsAValidSession } from "../utils/is-a-valid-session.ts";

serve(async (req) => {
  const { userUID, leaderUID } = await req.json();
  const existingNokhteSessionRes = (
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .select()
      .eq("leader_uid", leaderUID)
      .eq("has_begun", false)
  )?.data?.[0];

  let returnRes = {
    status: 200,
    message: "session successfully joined",
  };

  if (isNotEmptyOrNull(existingNokhteSessionRes)) {
    const currentCollaboratorUIDs =
      existingNokhteSessionRes?.["collaborator_uids"];
    if (!currentCollaboratorUIDs.includes(userUID)) {
      currentCollaboratorUIDs.push(userUID);
      currentCollaboratorUIDs.sort();
      const currentIsOnlineArr = existingNokhteSessionRes?.["is_online"];
      currentIsOnlineArr.push(true);
      const currentPhasesArr = existingNokhteSessionRes?.["current_phases"];
      currentPhasesArr.push(0);
      const currentHaveGyroscopesRes =
        existingNokhteSessionRes?.["have_gyroscopes"];
      currentHaveGyroscopesRes.push(true);
      const isAValidSession = await checkIfIsAValidSession(userUID);
      const { error } = await supabaseAdmin
        .from("active_nokhte_sessions")
        .update({
          collaborator_uids: currentCollaboratorUIDs,
          is_online: currentIsOnlineArr,
          current_phases: currentPhasesArr,
          have_gyroscopes: currentHaveGyroscopesRes,
          is_a_valid_session: isAValidSession,
        })
        .eq("leader_uid", leaderUID)
        .eq("has_begun", false);

      if (error != null) {
        returnRes = {
          status: 400,
          message: "collaboration uid conflict",
        };
      }
    }
  }

  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
