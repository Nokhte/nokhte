import { supabaseAdmin } from "../constants/supabase.ts";
import { captureNewNokhteSessionCollaborator } from "../posthog/capture/new_nokhte_session_collaborator.ts";

async function updateAuthorizedViewers(matchedUID: string, userUID: string) {
  const userAuthorizedViewersRes: Array<string> = (
    await supabaseAdmin.from("user_names").select().eq("uid", userUID)
  ).data?.[0]["authorized_viewers"];

  if (userAuthorizedViewersRes.includes(matchedUID)) {
    return;
  } else {
    userAuthorizedViewersRes.push(matchedUID);
    await supabaseAdmin
      .from("user_names")
      .update({
        authorized_viewers: userAuthorizedViewersRes,
      })
      .eq("uid", userUID);
    captureNewNokhteSessionCollaborator(userUID);
  }
  const collaboratorRowRes: Array<string> = (
    await supabaseAdmin.from("user_names").select().eq("uid", matchedUID)
  ).data?.[0]["authorized_viewers"];

  if (collaboratorRowRes.includes(userUID)) {
    return;
  } else {
    collaboratorRowRes.push(userUID);
    await supabaseAdmin
      .from("user_names")
      .update({
        authorized_viewers: collaboratorRowRes,
      })
      .eq("uid", matchedUID);
    captureNewNokhteSessionCollaborator(matchedUID);
  }
}

export { updateAuthorizedViewers };
