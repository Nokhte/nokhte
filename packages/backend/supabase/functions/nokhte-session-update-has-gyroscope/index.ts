import { supabaseAdmin } from "../constants/supabase.ts";
import { manageSessionUpdates } from "../utils/manage-session-updates.ts";
import { serve } from "std/server";

serve(async (req) => {
  const { newGyroscopeStatus, collaboratorUIDs, userIndex } = await req.json();

  const sessionRes = (
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .select()
      .eq("collaborator_uids", collaboratorUIDs)
  )?.data?.[0];

  const currentOnlineStatus = sessionRes["have_gyroscopes"];
  currentOnlineStatus[userIndex] = newGyroscopeStatus;
  await manageSessionUpdates(collaboratorUIDs, async function () {
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .update({
        have_gyroscopes: currentOnlineStatus,
      })
      .eq("collaborator_uids", collaboratorUIDs);
  });

  return new Response(JSON.stringify({}), {
    headers: { "Content-Type": "application/json" },
  });
});
