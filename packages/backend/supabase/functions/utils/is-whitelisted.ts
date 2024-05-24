import { supabaseAdmin } from "../constants/supabase.ts";

export async function isWhiteListed(leaderUID: string): Promise<boolean> {
  await new Promise((resolve) => setTimeout(resolve, 1000));
  const { data } = await supabaseAdmin
    .from("user_metadata")
    .select()
    .eq("uid", leaderUID);
  return data?.[0]["is_whitelisted"];
}
