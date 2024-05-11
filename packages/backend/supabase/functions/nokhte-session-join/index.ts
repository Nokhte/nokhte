import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";
import { isNotEmptyOrNull } from "../utils/array_utils.ts";

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
      let isAValidSession = true;
      if (currentCollaboratorUIDs.length > 3) {
        console.log("is it creater than 3", currentCollaboratorUIDs.length);
        for (let i = 0; i < currentCollaboratorUIDs.length; i++) {
          const userMetadataRes = (
            await supabaseAdmin
              .from("user_metadata")
              .select()
              .eq("uid", currentCollaboratorUIDs[i])
          )?.data?.[0];
          console.log(
            "QUESTION: userUID is",
            currentCollaboratorUIDs[i],
            " hasUsedTrial:",
            userMetadataRes?.["has_used_trial"],
            "isSubscribed: ",
            userMetadataRes?.["is_subscribed"]
          );
          if (
            userMetadataRes?.["has_used_trial"] === true &&
            userMetadataRes?.["is_subscribed"] === false
          ) {
            isAValidSession = false;
          }
        }
      }
      console.log("are you saying that isAValidSession is", isAValidSession);

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
