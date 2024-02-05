import { supabaseAdmin } from "../constants/supabase.ts";

async function updateAuthorizedViewers(matchedUID: string, userUID: string) {
  const userAuthorizedViewersRes: Array<string> = (
    await supabaseAdmin.from("user_names").select().eq("uid", userUID)
  ).data?.[0]["authorized_viewers"];
  if (userAuthorizedViewersRes.includes(matchedUID)) return;
  userAuthorizedViewersRes.push(matchedUID);
  const collaboratorRowRes: Array<string> = (
    await supabaseAdmin.from("user_names").select().eq("uid", matchedUID)
  ).data?.[0]["authorized_viewers"];
  if (collaboratorRowRes.includes(userUID)) return;
  collaboratorRowRes.push(userUID);
  await supabaseAdmin
    .from("user_names")
    .update({
      authorized_viewers: userAuthorizedViewersRes,
    })
    .eq("uid", userUID);
  await supabaseAdmin
    .from("user_names")
    .update({
      authorized_viewers: collaboratorRowRes,
    })
    .eq("uid", matchedUID);
}

export { updateAuthorizedViewers };
