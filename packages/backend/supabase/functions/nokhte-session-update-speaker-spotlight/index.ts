import { supabaseAdmin } from "../constants/supabase.ts";
import { manageSessionUpdates } from "../utils/manage-session-updates.ts";
import { serve } from "std/server";

serve(async (req) => {
  const { addUserToSpotlight, collaboratorUIDs, userUID } = await req.json();

  await manageSessionUpdates(collaboratorUIDs, async function () {
    const sessionRes = (
      await supabaseAdmin
        .from("active_nokhte_sessions")
        .select()
        .eq("collaborator_uids", collaboratorUIDs)
    )?.data?.[0];

    const currentSpeakerSpotlight = sessionRes["speaker_spotlight"];
    if (addUserToSpotlight) {
      if (currentSpeakerSpotlight === null) {
        await supabaseAdmin
          .from("active_nokhte_sessions")
          .update({
            speaker_spotlight: userUID,
          })
          .eq("collaborator_uids", collaboratorUIDs);
      }
    } else {
      if (currentSpeakerSpotlight === userUID) {
        await supabaseAdmin
          .from("active_nokhte_sessions")
          .update({
            speaker_spotlight: null,
          })
          .eq("collaborator_uids", collaboratorUIDs);
      }
    }
  });

  return new Response(JSON.stringify({ status: 200, message: "success" }), {
    headers: { "Content-Type": "application/json" },
  });
});
