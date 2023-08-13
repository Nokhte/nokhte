// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "std/server";
import { supabaseAdmin } from "../constants/supabase.ts";
import { isEmpty } from "../utils/array_utils.ts";

serve(async (_res) => {
  const mostRecentEntrant = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .select()
    .order("id", { ascending: false })
    .limit(1);
  const queryAdjective = mostRecentEntrant?.data?.[0]["query_adjective_id"];
  const queryNoun = mostRecentEntrant?.data?.[0]["query_noun_id"];
  const wayfarerQueryRes = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .select()
    .eq("wayfarer_adjective_id", queryAdjective)
    .eq("wayfarer_noun_id", queryNoun);
  let returnRes = wayfarerQueryRes.data;
  console.log(wayfarerQueryRes);
  if (isEmpty(wayfarerQueryRes?.data ?? [])) {
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
    JSON.stringify({ returnRes }),
    { headers: { "Content-Type": "application/json" } },
  );
});
