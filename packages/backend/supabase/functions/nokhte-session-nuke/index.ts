import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";

serve(async (req) => {
  const { userUID } = await req.json();

  let returnRes = {
    status: 200,
    message: "session successfully joined",
  };

  const { error } = await supabaseAdmin
    .from("active_nokhte_sessions")
    .delete()
    .eq("leader_uid", userUID)
    .eq("collaborator_uids", `{${userUID}}`)
    .select();

  if (error != null) {
    returnRes = {
      status: 400,
      message: "query failed",
    };
  }

  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
