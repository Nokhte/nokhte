import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";

serve(async (req) => {
  const { userUID } = await req.json();
  await supabaseAdmin
    .from("active_nokhte_sessions")
    .insert({
      leader_uid: userUID,
      collaborator_uids: [userUID],
    })
    .select();

  return new Response(JSON.stringify({}), {
    headers: { "Content-Type": "application/json" },
  });
});
