import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";
import { isANokhteInvitation } from "./is_a_nokhte_invitation.ts";

serve(async (req) => {
  const { wayfarerUID, queryUID, invitationType } = await req.json();
  await supabaseAdmin
    .from("collaborator_pool")
    .delete()
    .eq("wayfarer_uid", wayfarerUID);

  const mostRecentEntrant = await supabaseAdmin
    .from("collaborator_pool")
    .insert({
      wayfarer_uid: wayfarerUID,
      query_uid: queryUID,
      invitation_type: invitationType,
    })
    .select();

  let returnRes = {
    status: 200,
    message: "collaboration successfully forged",
  };
  if (mostRecentEntrant.error != null) {
    returnRes = {
      status: 400,
      message: "collaboration uid conflict",
    };
  }
  if (invitationType === "NOKHTE_SESSION") {
    isANokhteInvitation(queryUID, mostRecentEntrant);
  }
  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
