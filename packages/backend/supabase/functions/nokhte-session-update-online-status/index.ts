import { supabaseAdmin } from "../constants/supabase.ts";
import { manageSessionUpdates } from "../utils/manage-session-updates.ts";
import { serve } from "std/server";

serve(async (req) => {
  const { newOnlineStatus, collaboratorUIDs, userIndex } = await req.json();

  const sessionRes = (
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .select()
      .eq("collaborator_uids", collaboratorUIDs)
  )?.data?.[0];

  const currentOnlineStatus = sessionRes["is_online"];
  currentOnlineStatus[userIndex] = newOnlineStatus;
  await manageSessionUpdates(collaboratorUIDs, async function () {
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .update({
        is_online: currentOnlineStatus,
      })
      .eq("collaborator_uids", collaboratorUIDs);
  });

  return new Response(JSON.stringify({}), {
    headers: { "Content-Type": "application/json" },
  });
});
