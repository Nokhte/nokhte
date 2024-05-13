import { supabaseAdmin } from "../constants/supabase.ts";
import { manageSessionUpdates } from "../utils/manage-session-updates.ts";
import { serve } from "std/server";

serve(async (req) => {
  const { newStatus, collaboratorUIDs, userIndex, shouldUpdateOnlineStatus } =
    await req.json();

  const sessionRes = (
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .select()
      .eq("collaborator_uids", collaboratorUIDs)
  )?.data?.[0];

  const column = shouldUpdateOnlineStatus ? "is_online" : "have_gyroscopes";

  const currentStatus = sessionRes[column];
  currentStatus[userIndex] = newStatus;
  await manageSessionUpdates(collaboratorUIDs, async function () {
    if (column === "is_online") {
      await supabaseAdmin
        .from("active_nokhte_sessions")
        .update({
          is_online: currentStatus,
        })
        .eq("collaborator_uids", collaboratorUIDs);
    } else {
      await supabaseAdmin
        .from("active_nokhte_sessions")
        .update({
          have_gyroscopes: currentStatus,
        })
        .eq("collaborator_uids", collaboratorUIDs);
    }
  });

  return new Response(JSON.stringify({}), {
    headers: { "Content-Type": "application/json" },
  });
});
