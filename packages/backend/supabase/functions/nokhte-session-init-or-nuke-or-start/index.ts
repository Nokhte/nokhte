import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";

serve(async (req) => {
  const { userUID, shouldInitialize, shouldStart } = await req.json();
  let returnRes = {
    status: 200,
    message: shouldInitialize ? "successful initialization" : "successful nuke",
  };
  if (shouldInitialize && !shouldStart) {
    const metadataRes = (
      await supabaseAdmin.from("user_metadata").select().eq("uid", userUID)
    )?.data?.[0];
    const hasPremiumAccess =
      metadataRes?.["is_subscribed"] || metadataRes?.["has_used_trial"];
    const { error } = await supabaseAdmin
      .from("active_nokhte_sessions")
      .insert({
        leader_uid: userUID,
        collaborator_uids: [userUID],
        has_premium_access: [hasPremiumAccess],
      })
      .select();
    if (error != null) {
      returnRes = {
        status: 400,
        message: "initialization failed",
      };
    }
  } else if (shouldStart) {
    const { error } = await supabaseAdmin
      .from("active_nokhte_sessions")
      .update({
        has_begun: true,
      })
      .eq("leader_uid", userUID)
      .select();
    if (error != null) {
      returnRes = {
        status: 400,
        message: "Session start failed",
      };
    }
  } else {
    const { error } = await supabaseAdmin
      .from("active_nokhte_sessions")
      .delete()
      .eq("leader_uid", userUID)
      .eq("collaborator_uids", `{${userUID}}`)
      .select();

    if (error != null) {
      returnRes = {
        status: 400,
        message: "nuke failed",
      };
    }
  }

  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
