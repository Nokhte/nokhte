import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";
import { isANokhteInvitation } from "./is_a_nokhte_invitation.ts";
import { isAColaborationInvitation } from "./is_a_collaboration_invitation.ts";

serve(async (req) => {
  const { wayfarerUID, queryUID, invitationType } = await req.json();
  await supabaseAdmin
    .from("p2p_collaborator_pool")
    .delete()
    .eq("wayfarer_uid", wayfarerUID);

  const mostRecentEntrant = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .insert({
      wayfarer_uid: wayfarerUID,
      query_uid: queryUID,
      invitation_type: invitationType,
    })
    .select();
  if (invitationType === "NOKHTE_SESSION") {
    isANokhteInvitation(queryUID, mostRecentEntrant);
  } else {
    isAColaborationInvitation(queryUID, wayfarerUID, mostRecentEntrant);
  }
  const returnRes = [
    {
      status: 200,
      message: "collaboration successfully forged",
    },
  ];
  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
