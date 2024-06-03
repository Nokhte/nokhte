import { supabaseAdmin } from "../constants/supabase.ts";

export async function getSessionUID(userUID: string): Promise<boolean> {
  await new Promise((resolve) => setTimeout(resolve, 1000));
  const { data } = await supabaseAdmin
    .from("st_active_nokhte_sessions")
    .select()
    .contains("collaborator_uids", `{${userUID}}`);
  return data?.[0]?.["session_uid"];
}
