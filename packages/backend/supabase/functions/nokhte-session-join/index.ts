import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";
import { isNotEmptyOrNull } from "../utils/array-utils.ts";

serve(async (req) => {
  const { userUID, leaderUID } = await req.json();
  const stExistingNokhteSessionRes = (
    await supabaseAdmin
      .from("st_active_nokhte_sessions")
      .select()
      .eq("leader_uid", leaderUID)
  )?.data;

  let returnRes = {
    status: 200,
    message: "session successfully joined",
  };

  if (isNotEmptyOrNull(stExistingNokhteSessionRes)) {
    const sessionUID = stExistingNokhteSessionRes?.[0]["session_uid"];
    const rtExistingNokhteSessionRes = (
      await supabaseAdmin
        .from("rt_active_nokhte_sessions")
        .select()
        .eq("session_uid", sessionUID)
    )?.data?.[0];
    if (!rtExistingNokhteSessionRes?.["has_begun"]) {
      const currentCollaboratorUIDs =
        stExistingNokhteSessionRes?.[0]["collaborator_uids"];
      if (!currentCollaboratorUIDs.includes(userUID)) {
        currentCollaboratorUIDs.push(userUID);

        const currentIsOnlineArr = rtExistingNokhteSessionRes?.["is_online"];
        currentIsOnlineArr.push(true);

        const currentPhasesArr = rtExistingNokhteSessionRes?.["current_phases"];
        currentPhasesArr.push(0);
        const { error } = await supabaseAdmin
          .from("st_active_nokhte_sessions")
          .update({
            collaborator_uids: currentCollaboratorUIDs,
          })
          .eq("leader_uid", leaderUID);

        const rtRes = await supabaseAdmin
          .from("rt_active_nokhte_sessions")
          .update({
            is_online: currentIsOnlineArr,
            current_phases: currentPhasesArr,
          })
          .eq("session_uid", sessionUID);
        if (error != null || rtRes?.error != null) {
          returnRes = {
            status: 400,
            message: "collaboration uid conflict",
          };
        }
      }
    }
  }

  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
