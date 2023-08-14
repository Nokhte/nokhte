import { serve } from "std/server";
import { isNotEmptyOrNull } from "../utils/array_utils.ts";
import { supabaseAdmin } from "../constants/supabase.ts";

serve(async (req) => {
  const { wayfarerUID, queryAdjectiveID, queryNounID } = await req.json();
  const phrasesRes = await supabaseAdmin.from("collaborator_phrases").select()
    .eq("uid", wayfarerUID);
  const wayfarerAdjectiveID: string = phrasesRes.data?.[0]?.["adjective_id"];
  const wayfarerNounID: string = phrasesRes.data?.[0]?.["noun_id"];
  const mostRecentEntrant = await supabaseAdmin.from("p2p_collaborator_pool")
    .insert({
      "wayfarer_uid": wayfarerUID,
      "wayfarer_adjective_id": wayfarerAdjectiveID,
      "wayfarer_noun_id": wayfarerNounID,
      "query_adjective_id": queryAdjectiveID,
      "query_noun_id": queryNounID,
    }).select();
    const queryAdjective = mostRecentEntrant?.data?.[0]["query_adjective_id"];
    const queryNoun = mostRecentEntrant?.data?.[0]["query_noun_id"];
  const wayfarerQueryRes = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .select()
    .eq("wayfarer_adjective_id", queryAdjective)
    .eq("wayfarer_noun_id", queryNoun);
  let returnRes = wayfarerQueryRes.data;
  if (isNotEmptyOrNull(wayfarerQueryRes?.data)) {
    const matchedUID = wayfarerQueryRes.data?.[0]?.["wayfarer_uid"];
    const matchedAdjectiveId = wayfarerQueryRes.data?.[0]
      ?.["wayfarer_adjective_id"];
    const matchedNounId = wayfarerQueryRes.data?.[0]?.["wayfarer_noun_id"];
    const updateRes = await supabaseAdmin.from("p2p_collaborator_pool").update({
      "matched_uid": matchedUID,
      "matched_adjective_id": matchedAdjectiveId,
      "matched_noun_id": matchedNounId,
    })
      .eq("wayfarer_uid", mostRecentEntrant.data?.[0]["wayfarer_uid"])
      .select();
    returnRes = updateRes.data;
  }
  return new Response(
    JSON.stringify(returnRes),
    { headers: { "Content-Type": "application/json" } },
  );
});

/* To invoke:
# FIRST ONE
curl -i --location --request POST 'http://localhost:54321/functions/v1/initiate-collaborator-search' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
--header 'Content-Type: application/json' \
--data '{"wayfarerUID":"f5fbf3a5-bb45-4bc4-99f0-97618930e6ad", "queryAdjectiveID": "79", "queryNounID": "43"}'
curl -i --location --request POST 'http://localhost:54321/functions/v1/initiate-collaborator-search' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
--header 'Content-Type: application/json' \
--data '{"wayfarerUID":"0d7ce7b3-5b59-48ed-8015-a7c2fd4cb2ae", "queryAdjectiveID": "118", "queryNounID": "67"}'
# SECOND ONE
*/
