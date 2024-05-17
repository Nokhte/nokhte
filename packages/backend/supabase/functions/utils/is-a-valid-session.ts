// deno-lint-ignore-file
// deno-lint-ignore-file no-explicit-any
import { supabaseAdmin } from "../constants/supabase.ts";

export async function checkIfIsAValidSession(userUID: any): Promise<boolean> {
  let isAValidSession = true;
  const currentCollaboratorUIDs = (
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .select()
      .filter("collaborator_uids", "cs", `{${userUID}}`)
  )?.data?.[0]?.["collaborator_uids"];

  if (currentCollaboratorUIDs.length > 3) {
    for (let i = 0; i < currentCollaboratorUIDs.length; i++) {
      const userMetadataRes = (
        await supabaseAdmin
          .from("user_metadata")
          .select()
          .eq("uid", currentCollaboratorUIDs[i])
      )?.data?.[0];
      if (
        userMetadataRes?.["has_used_trial"] === true &&
        userMetadataRes?.["is_subscribed"] === false
      ) {
        isAValidSession = false;
      }
    }
  }
  return isAValidSession;
}
