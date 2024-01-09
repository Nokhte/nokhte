import { serve } from "std/server";
import { isNotEmptyOrNull, isEmptyOrNull } from "../utils/array_utils.ts";
import { supabaseAdmin } from "../constants/supabase.ts";
import { randomNumber } from "random_number";

serve(async (req) => {
  const { wayfarerUID, queryUID } = await req.json();
  await supabaseAdmin
    .from("p2p_collaborator_pool")
    .delete()
    .eq("wayfarer_uid", wayfarerUID);

  const mostRecentEntrant = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .insert({
      wayfarer_uid: wayfarerUID,
      query_uid: queryUID,
    })
    .select();
  const wayfarerQueryRes = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .select()
    .eq("wayfarer_uid", queryUID);

  let returnRes = wayfarerQueryRes.data;

  if (isNotEmptyOrNull(wayfarerQueryRes?.data)) {
    const whoGetsTheQuestion = randomNumber();
    const matchedUID = wayfarerQueryRes.data?.[0]?.["wayfarer_uid"];
    const matchedAdjectiveId =
      wayfarerQueryRes.data?.[0]?.["wayfarer_adjective_id"];
    const matchedNounId = wayfarerQueryRes.data?.[0]?.["wayfarer_noun_id"];
    await supabaseAdmin
      .from("p2p_collaborator_pool")
      .update({
        matched_uid: matchedUID,
      })
      .eq("wayfarer_uid", mostRecentEntrant.data?.[0]["wayfarer_uid"]);
    const checkRespose = await supabaseAdmin
      .from("existing_collaborations")
      .select()
      .or(
        `collaboration_id.eq.${wayfarerUID}_${matchedUID},collaboration_id.eq.${matchedUID}_${wayfarerUID}`
      );
    if (isEmptyOrNull(checkRespose?.data)) {
      await supabaseAdmin.from("existing_collaborations").insert({
        collaborator_one: wayfarerUID,
        collaborator_two: matchedUID,
        collaboration_id: `${wayfarerUID}_${matchedUID}`,
        who_gets_the_question: whoGetsTheQuestion % 2 === 0 ? 1 : 2,
      });
      await supabaseAdmin
        .from("p2p_collaborator_pool")
        .delete()
        .eq("wayfarer_uid", wayfarerUID);
      await supabaseAdmin
        .from("p2p_collaborator_pool")
        .delete()
        .eq("wayfarer_uid", matchedUID);
    }
  }
  returnRes = [
    {
      status: 200,
      message: "collaboration successfully forged",
    },
  ];
  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
