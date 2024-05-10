import { supabaseAdmin } from "../constants/supabase.ts";
import { isEmptyOrNull } from "../utils/array_utils.ts";
import { serve } from "std/server";

serve(async (req) => {
  const { collaboratorUIDs } = await req.json();

  const sessionRes = (
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .delete()
      .eq("collaborator_uids", collaboratorUIDs)
      .select()
  )?.data?.[0];

  const content = sessionRes["content"];
  const sessionTimestamp = sessionRes["created_at"];
  const sessionUID = sessionRes["session_uid"];
  const collaboratorUIDsArr = sessionRes["collaborator_uids"];

  const duplicateCheckRes = (
    await supabaseAdmin
      .from("finished_nokhte_session")
      .select()
      .eq("collaborator_uids", collaboratorUIDs)
      .eq("content", content)
  )?.data;

  let returnRes = {
    status: 200,
    message: "success",
  };

  if (isEmptyOrNull(duplicateCheckRes)) {
    const { error } = await supabaseAdmin
      .from("finished_nokhte_sessions")
      .insert({
        collaborator_uids: collaboratorUIDs,
        content: content,
        session_timestamp: sessionTimestamp,
        aliases: Array(collaboratorUIDsArr.length).fill(""),
        session_uid: sessionUID,
      })
      .select();

    if (collaboratorUIDsArr.length > 3) {
      for (let i = 0; i < collaboratorUIDsArr.length; i++) {
        await supabaseAdmin
          .from("user_metadata")
          .update({
            has_used_trial: true,
          })
          .eq("uid", collaboratorUIDsArr[i]);
      }
    }

    if (error != null) {
      returnRes = {
        status: 400,
        message: "failed query",
      };
    }
  }
  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
