// deno-lint-ignore-file no-explicit-any
import { randomNumber } from "random_number";
import { supabaseAdmin } from "../constants/supabase.ts";
import { isEmptyOrNull, isNotEmptyOrNull } from "../utils/array_utils.ts";

async function isAColaborationInvitation(
  queryUID: string,
  wayfarerUID: string,
  mostRecentEntrant: any
) {
  const wayfarerQueryRes = await supabaseAdmin
    .from("p2p_collaborator_pool")
    .select()
    .eq("wayfarer_uid", queryUID);
  if (isNotEmptyOrNull(wayfarerQueryRes?.data)) {
    const whoGetsTheQuestion = randomNumber();
    const matchedUID = wayfarerQueryRes.data?.[0]?.["wayfarer_uid"];
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
}
export { isAColaborationInvitation };
