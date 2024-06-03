import { supabaseAdmin } from "../constants/supabase.ts";
import { isNotEmptyOrNull } from "./array-utils.ts";

export async function checkIfHasDoneASession(
  userUID: string
): Promise<boolean> {
  const finishedSessionRes = (
    await supabaseAdmin
      .from("finished_nokhte_sessions")
      .select()
      .contains("collaborator_uids", `{${userUID}}`)
  )?.data;
  let hasDoneASessionBefore = false;
  if (isNotEmptyOrNull(finishedSessionRes)) {
    hasDoneASessionBefore = true;
  }
  return hasDoneASessionBefore;
}
