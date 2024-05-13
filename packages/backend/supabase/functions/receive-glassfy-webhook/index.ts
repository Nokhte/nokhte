// deno-lint-ignore-file
import { serve } from "std/server";
import { importJWK, jwtVerify } from "jose";
import { supabaseAdmin } from "../constants/supabase.ts";

serve(async (req) => {
  const glassfyPubKey = await fetch(
    "https://dashboard.glassfy.io/.well-known/jwks.json"
  );
  const jwk = (await glassfyPubKey.json())["keys"][0];
  const jws = await req.text();
  const pubKey = await importJWK(jwk);
  let returnRes = {
    status: 200,
    message: "successfully received webhook",
  };
  try {
    const { payload } = await jwtVerify(jws, pubKey);
    const { event }: any = payload;
    const { subscriberid } = event;
    const isSubscriptionActive = event["is_subscription_active"];
    await supabaseAdmin
      .from("user_metadata")
      .update({ is_subscribed: isSubscriptionActive })
      .eq("subscriber_id", subscriberid);
  } catch (e) {
    returnRes = {
      status: 400,
      message: e,
    };
  }

  return new Response(JSON.stringify(returnRes), {
    headers: { "Content-Type": "application/json" },
  });
});

/* To invoke locally:
    curl -i --location --request POST  'http://127.0.0.1:54321/functions/v1/receive-glassfy-webhook'\
  -H 'Content-Type: application/jwt' \
  -d 'eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJldmVudCI6eyJzb3J0X2RhdGVfbXMiOjE2NDQ5MzM4MzIwMDAsImlkIjoiMjFlOGZlNGVhMjllNGQ2OTlhNWJlNDMyY2Y3OWRkOWEiLCJldmVudF9kYXRlIjoxNjQ0OTMzODM4LCJzb3VyY2UiOiJTREsiLCJ0eXBlIjo1MDA4LCJlbnZpcm9ubWVudCI6IlMiLCJzdG9yZSI6IjEiLCJ2ZW5kb3JpZCI6IjhOT1Y2RlFCSEhSSjRGOU4ySFYwSFVYT1E1TEwwUUEzIiwiYXBwaWQiOiJTWjEyNlVXV1ZHVEg4MlVFOTMxM0VRUTVOMVlNM1FPQSIsInN1YnNjcmliZXJpZCI6ImRmZDI5NzYzZTUzMDQ3MDY4OGE1NzQxZjQxOWU3YzA3Iiwib3JpZ2luYWxfdHJhbnNhY3Rpb25faWQiOiIxMDAwMDAwOTY5NDMxMTQ2IiwidHJhbnNhY3Rpb25faWQiOiIxMDAwMDAwOTY5NDMxMTQ2IiwicHJvZHVjdGlkIjoiaW9zX3JlYWRfYXJ0aWNsZV81IiwiZGF0ZV9tcyI6MTY0NDkzMzgzMjAwMCwib3JpZ2luYWxfcHVyY2hhc2VfZGF0ZV9tcyI6MTY0NDkzMzgzMjAwMCwicHJpY2UiOjAuOTksInByaWNlX3VzZCI6MS4zMzgxMzE5MTY5Mjc5ODI4LCJjdXJyZW5jeV9jb2RlIjoiR0JQIiwiY291bnRyeV9jb2RlIjoiR0IiLCJxdWFudGl0eSI6MSwid2ViX29yZGVyX2xpbmVfaXRlbV9pZCI6IiIsImRheXMiOjc3MTUsIndlZWtzIjoxMTAyLCJtb250aHMiOjI1MywiYXV0b19yZW5ld19wcm9kdWN0X2lkIjoiIiwiYXV0b19yZW5ld19zdGF0dXMiOmZhbHNlLCJncmFjZV9wZXJpb2RfZXhwaXJlc19kYXRlX21zIjowLCJpc19pbl9iaWxsaW5nX3JldHJ5X3BlcmlvZCI6ZmFsc2UsInByaWNlX2NvbnNlbnRfc3RhdHVzIjoiIiwib2ZmZXJfY29kZV9yZWZfbmFtZSI6IiIsIm9mZmVyaW5naWQiOiJjb25zdW1hYmxlX2FydGljbGVzIiwiZXhwaXJhdGlvbl9pbnRlbnQiOiIiLCJ1c2VydW5rbm93biI6ZmFsc2UsInN1Yl9wbGF0Zm9ybSI6IjEiLCJzeXN0ZW1fdmVyc2lvbiI6IjE1LjMuMSIsImRldmljZSI6ImlQaG9uZTE0LDIiLCJzZGtfdmVyc2lvbiI6ImRldiIsImJ1bmRsZV92ZXJzaW9uIjoiMSIsImFwcF92ZXJzaW9uIjoiMS4wIn0sImV4cCI6MTY0NDkzNzQzOCwiaXNzIjoiZ2xhc3NmeSJ9.mOIfTrxy2LBQTq_TwpTzFnkQQ06KahgMUKsZO7GKJq_-e1a0nqEDraH_mRmosrxNSQqEnelHne0Jg7_EmkqTOg'

*/
