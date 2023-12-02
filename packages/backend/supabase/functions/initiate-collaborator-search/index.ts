import { serve } from "std/server";
import { isNotEmptyOrNull } from "../utils/array_utils.ts";
import { supabaseAdmin } from "../constants/supabase.ts";
import { randomNumber } from "random_number";

serve(async (req) => {
  const { wayfarerUID, queryAdjectiveID, queryNounID } = await req.json();
  await supabaseAdmin
    .from("p2p_collaborator_pool")
    .delete()
    .eq("wayfarer_uid", wayfarerUID);
  const phrasesRes = await supabaseAdmin
    .from("collaborator_phrases")
    .select()
    .eq("uid", wayfarerUID);
  const wayfarerAdjectiveID: string = phrasesRes.data?.[0]?.["adjective_id"];
  const wayfarerNounID: string = phrasesRes.data?.[0]?.["noun_id"];
  const mostRecentEntrant = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .insert({
      wayfarer_uid: wayfarerUID,
      wayfarer_adjective_id: wayfarerAdjectiveID,
      wayfarer_noun_id: wayfarerNounID,
      query_adjective_id: queryAdjectiveID,
      query_noun_id: queryNounID,
    })
    .select();
  const queryAdjective = mostRecentEntrant?.data?.[0]["query_adjective_id"];
  const queryNoun = mostRecentEntrant?.data?.[0]["query_noun_id"];
  const wayfarerQueryRes = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .select()
    .eq("wayfarer_adjective_id", queryAdjective)
    .eq("wayfarer_noun_id", queryNoun);
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
        matched_adjective_id: matchedAdjectiveId,
        matched_noun_id: matchedNounId,
      })
      .eq("wayfarer_uid", mostRecentEntrant.data?.[0]["wayfarer_uid"]);
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
  returnRes = [
    {
      status: 200,
      message: "collaboration successfully forged",
    },
  ];
  // }
  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});
