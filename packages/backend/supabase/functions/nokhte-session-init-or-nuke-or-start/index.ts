import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";
import { getSessionUID } from "../utils/get-session-uid.ts";
import { isNotEmptyOrNull } from "../utils/array-utils.ts";

serve(async (req) => {
  const { userUID, shouldInitialize, shouldStart, presetUID } =
    await req.json();
  let returnRes = {
    status: 200,
    message: shouldInitialize ? "successful initialization" : "successful nuke",
  };
  if (shouldInitialize && !shouldStart) {
    const { data } = await supabaseAdmin
      .from("st_active_nokhte_sessions")
      .insert({
        leader_uid: userUID,
        collaborator_uids: [userUID],
        preset_uid: presetUID,
      })
      .select();
    const sessionUID = data?.[0]?.["session_uid"];
    const { error } = await supabaseAdmin
      .from("rt_active_nokhte_sessions")
      .insert({
        session_uid: sessionUID,
      });
    if (error != null) {
      returnRes = {
        status: 400,
        message: "initialization failed",
      };
    }
  } else if (shouldStart) {
    const sessionUID = await getSessionUID(userUID);
    const { error } = await supabaseAdmin
      .from("rt_active_nokhte_sessions")
      .update({
        has_begun: true,
      })
      .eq("session_uid", sessionUID)
      .select();
    if (error != null) {
      returnRes = {
        status: 400,
        message: "Session start failed",
      };
    }
  } else {
    const sessionRes = (
      await supabaseAdmin
        .from("st_active_nokhte_sessions")
        .select()
        .eq("leader_uid", userUID)
    )?.data;
    if (isNotEmptyOrNull(sessionRes)) {
      const sessionShouldBeNuked =
        sessionRes?.[0]["collaborator_uids"].length === 1;
      if (sessionShouldBeNuked) {
        const sessionUID = await getSessionUID(userUID);
        const { error } = await supabaseAdmin
          .from("rt_active_nokhte_sessions")
          .delete()
          .eq("session_uid", sessionUID);
        await supabaseAdmin
          .from("st_active_nokhte_sessions")
          .delete()
          .eq("leader_uid", userUID);
        if (error != null) {
          returnRes = {
            status: 400,
            message: "nuke failed",
          };
        }
      }
    }
  }

  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
