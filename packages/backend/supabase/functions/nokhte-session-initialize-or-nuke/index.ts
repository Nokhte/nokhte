import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";

serve(async (req) => {
  const { userUID, shouldInitialize } = await req.json();
  let returnRes = {
    status: 200,
    message: shouldInitialize ? "successful initialization" : "successful nuke",
  };
  if (shouldInitialize) {
    const { error } = await supabaseAdmin
      .from("active_nokhte_sessions")
      .insert({
        leader_uid: userUID,
        collaborator_uids: [userUID],
      })
      .select();
    if (error != null) {
      returnRes = {
        status: 400,
        message: "initialization failed",
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
