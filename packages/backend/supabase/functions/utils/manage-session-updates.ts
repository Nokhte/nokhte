// deno-lint-ignore-file no-explicit-any
import { supabaseAdmin } from "../constants/supabase.ts";
import { isNotEmptyOrNull } from "./array_utils.ts";

type voidCallback = () => Promise<void>;

export async function manageSessionUpdates(
  formattedCollaboratorUIDs: any,
  callback: voidCallback
) {
  const sessionResData = (
    await supabaseAdmin
      .from("active_nokhte_sessions")
      .select()
      .eq("collaborator_uids", formattedCollaboratorUIDs)
  )?.data;
  if (isNotEmptyOrNull(sessionResData)) {
    const collaboratorUIDs = sessionResData?.[0]?.["collaborator_uids"];
    if (collaboratorUIDs.length <= 3) {
      await callback();
    } else {
      let canMakeOperation: boolean = true;
      for (let i = 0; i < collaboratorUIDs.length; i++) {
        const userMetadataRes = (
          await supabaseAdmin
            .from("user_metadata")
            .select()
            .eq("uid", collaboratorUIDs[i])
        )?.data;
        if (
          userMetadataRes?.[0]?.["has_used_trial"] === true &&
          userMetadataRes?.[0]?.["is_subscribed"] === false
        ) {
          canMakeOperation = false;
        }
      }
      if (canMakeOperation) {
        await callback();
      }
    }
  }
}
