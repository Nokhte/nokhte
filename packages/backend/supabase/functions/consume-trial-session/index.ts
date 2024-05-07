import { supabaseAdmin } from "../constants/supabase.ts";
import { serve } from "std/server";
serve(async (req) => {
  const { userUID } = await req.json();

  const { error } = await supabaseAdmin
    .from("user_metadata")
    .update({
      has_used_trial: true,
    })
    .eq("uid", userUID);

  let returnRes = {
    status: 200,
    message: "successfully consumed trial",
  };

  if (error != null) {
    returnRes = {
      status: 400,
      message: "invalid query",
    };
  }

  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
