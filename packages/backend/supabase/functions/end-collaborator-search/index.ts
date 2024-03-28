import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";

serve(async (req) => {
  const { overstayingWayfarer } = await req.json();
  let returnRes = {
    status: 200,
    message: "successfully removed from pool",
  };
  const res = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .delete()
    .eq("wayfarer_uid", overstayingWayfarer);
  if (res.error != null) {
    returnRes = {
      status: 400,
      message: "failed to remove from pool",
    };
  }

  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
