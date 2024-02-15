import { PostHogClient } from "../constants.ts";

export function captureNewNokhteSessionCollaborator(userUID: string) {
  PostHogClient.capture({
    distinctId: userUID,
    event: "add_new_nokhte_session_collaborator",
  });
}
