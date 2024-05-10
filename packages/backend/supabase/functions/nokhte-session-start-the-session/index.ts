import { supabaseAdmin } from "../constants/supabase.ts";
import { serve } from "std/server";

serve(async (req) => {
  const { collaboratorUIDs } = await req.json();

  const sessionStartRes = await supabaseAdmin
    .from("active_nokhte_sessions")
    .update({
      has_begun: true,
    })
    .eq("collaborator_uids", collaboratorUIDs);

  let returnRes = {
    status: 200,
    message: "Session successfully started",
  };
  if (sessionStartRes.error != null) {
    returnRes = {
      status: 400,
      message: "collaboration uid conflict",
    };
  }
  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
