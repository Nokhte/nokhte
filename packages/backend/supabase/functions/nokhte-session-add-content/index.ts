// deno-lint-ignore-file
import { supabaseAdmin } from "../constants/supabase.ts";
import { manageSessionUpdates } from "../utils/manage-session-updates.ts";
import { serve } from "std/server";

serve(async (req) => {
  const { newContent, collaboratorUIDs } = await req.json();
  const sessionRes = (
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .select()
      .eq("collaborator_uids", collaboratorUIDs)
  )?.data?.[0];
  const currentContent = sessionRes["content"].filter(
    (x: string) => x !== null
  );
  currentContent.push(newContent);
  await manageSessionUpdates(collaboratorUIDs, async function () {
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .update({
        content: currentContent,
      })
      .eq("collaborator_uids", collaboratorUIDs);
  });

  return new Response(JSON.stringify({ status: 200, message: "success" }), {
    headers: { "Content-Type": "application/json" },
  });
});
