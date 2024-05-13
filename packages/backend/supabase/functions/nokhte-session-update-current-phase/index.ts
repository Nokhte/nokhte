import { supabaseAdmin } from "../constants/supabase.ts";
import { manageSessionUpdates } from "../utils/manage-session-updates.ts";
import { serve } from "std/server";

serve(async (req) => {
  const { newPhase, collaboratorUIDs, userIndex } = await req.json();

  await manageSessionUpdates(collaboratorUIDs, async function () {
    await supabaseAdmin.rpc("update_nokhte_session_phase", {
      incoming_uids: collaboratorUIDs,
      index_to_edit: userIndex,
      new_value: newPhase,
    });
  });

  return new Response(JSON.stringify({ status: 200, message: "success" }), {
    headers: { "Content-Type": "application/json" },
  });
});
