import { PostHog } from "https://esm.sh/posthog-node@3.6.2";

export const PostHogClient = new PostHog(
  Deno.env.get("POSTHOG_API_KEY") ?? "",
  {
    host: "https://app.posthog.com",
  }
);
