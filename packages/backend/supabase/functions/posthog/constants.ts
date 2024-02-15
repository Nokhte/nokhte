import { PostHog } from "posthog";

export const PostHogClient = new PostHog(
  Deno.env.get("POSTHOG_API_KEY") ?? "",
  {
    host: "https://app.posthog.com",
  }
);
