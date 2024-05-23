import { supabaseAdmin } from "../constants/supabase.ts";
import {
  isEmptyOrNull,
  isNotEmptyOrNull,
  onlyUnique,
} from "../utils/array_utils.ts";
import { serve } from "std/server";

serve(async (req) => {
  const { collaboratorUIDs } = await req.json();

  const sessionRes = await supabaseAdmin
    .from("active_nokhte_sessions")
    .delete()
    .eq("collaborator_uids", collaboratorUIDs)
    .select();
  let returnRes = {
    status: 200,
    message: "success",
  };

  if (isNotEmptyOrNull(sessionRes?.data)) {
    const content = sessionRes?.data?.[0]["content"];
    const sessionTimestamp = sessionRes?.data?.[0]["created_at"];
    const sessionUID = sessionRes?.data?.[0]["session_uid"];
    const collaboratorUIDsArr = sessionRes?.data?.[0]["collaborator_uids"];
    const currentPhases = sessionRes?.data?.[0]["current_phases"];

    const duplicateCheckRes = (
      await supabaseAdmin
        .from("finished_nokhte_session")
        .select()
        .eq("collaborator_uids", collaboratorUIDs)
        .eq("content", content)
    )?.data;
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

      for (let i = 0; i < collaboratorUIDsArr.length; i++) {
        if (
          collaboratorUIDsArr.length > 3 &&
          currentPhases.every((e: any) => e >= 2)
        ) {
          await supabaseAdmin
            .from("user_metadata")
            .update({
              has_used_trial: true,
            })
            .eq("uid", collaboratorUIDsArr[i]);
        }

        const userAuthorizedViewersRes = (
          await supabaseAdmin
            .from("user_information")
            .select()
            .eq("uid", collaboratorUIDsArr[i])
        )?.data?.[0]?.["authorized_viewers"];
        const userAuthorizedViewers =
          userAuthorizedViewersRes.concat(collaboratorUIDsArr);
        const viewersMinusUserUID = userAuthorizedViewers.filter(
          (x: string) => x !== collaboratorUIDsArr[i]
        );
        const uniqueViewers = viewersMinusUserUID.filter(onlyUnique);
        uniqueViewers.sort();
        await supabaseAdmin
          .from("user_information")
          .update({
            authorized_viewers: uniqueViewers,
          })
          .eq("uid", collaboratorUIDsArr[i]);
      }

      if (error != null) {
        returnRes = {
          status: 400,
          message: "failed query",
        };
      }
    }
  }

  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
