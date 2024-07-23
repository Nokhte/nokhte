import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";
import { isNotEmptyOrNull } from "../utils/array-utils.ts";
import { isWhiteListed } from "../utils/is-whitelisted.ts";

serve(async (req) => {
  const { userUID, leaderUID } = await req.json();
  const stExistingNokhteSessionRes = (
    await supabaseAdmin
      .from("st_active_nokhte_sessions")
      .select()
      .eq("leader_uid", leaderUID)
  )?.data?.[0];

  let returnRes = {
    status: 200,
    message: "session successfully joined",
  };

  if (isNotEmptyOrNull(stExistingNokhteSessionRes)) {
    const sessionUID = stExistingNokhteSessionRes?.["session_uid"];
    const rtExistingNokhteSessionRes = (
      await supabaseAdmin
        .from("rt_active_nokhte_sessions")
        .select()
        .eq("session_uid", sessionUID)
    )?.data?.[0];
    if (!rtExistingNokhteSessionRes?.["has_begun"]) {
      const currentCollaboratorUIDs =
        stExistingNokhteSessionRes?.["collaborator_uids"];
      if (!currentCollaboratorUIDs.includes(userUID)) {
        currentCollaboratorUIDs.push(userUID);
        const currentHasPremiumAccess = [];

        const currentIsOnlineArr = rtExistingNokhteSessionRes?.["is_online"];
        currentIsOnlineArr.push(true);

        const currentPhasesArr = rtExistingNokhteSessionRes?.["current_phases"];
        currentPhasesArr.push(0);
        for (let i = 0; i < currentCollaboratorUIDs.length; i++) {
          const metadataRes = (
            await supabaseAdmin
              .from("user_metadata")
              .select()
              .eq("uid", currentCollaboratorUIDs[i])
          )?.data?.[0];
          const leaderIsWhitelisted = await isWhiteListed(leaderUID);
          const userPremiumAccess =
            metadataRes?.["is_subscribed"] ||
            !metadataRes?.["has_used_trial"] ||
            leaderIsWhitelisted;
          console.log(userPremiumAccess, "USER!!!!!");
          currentHasPremiumAccess.push(userPremiumAccess);
        }
        const { error } = await supabaseAdmin
          .from("st_active_nokhte_sessions")
          .update({
            collaborator_uids: currentCollaboratorUIDs,
            has_premium_access: currentHasPremiumAccess,
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
