import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";

serve(async (req) => {
  const { overstayingWayfarer } = await req.json();
  const deleteRes = await supabaseAdmin.from("p2p_collaborator_pool").delete()
    .eq("wayfarer_uid", overstayingWayfarer);
  return new Response(
    JSON.stringify(deleteRes.data),
    { headers: { "Content-Type": "application/json" } },
  );
});
