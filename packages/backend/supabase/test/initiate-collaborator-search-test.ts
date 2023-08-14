import { assert, assertEquals, assertExists } from "std/testing";
import { createClient, SupabaseClient } from "supabase";
// import { delay } from "delay";

// const supabaseUrl = 'http://localhost:54321'
// const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0'

const supabaseUrl = Deno.env.get('LOCAL_SUPABASE_URL') ?? ''
const supabaseKey = Deno.env.get('LOCAL_SUPABASE_ANON_KEY') ?? ''
const options = {
  auth: {
    autoRefreshToken: false,
    persistSession: false,
    detectSessionInUrl: false,
  },
}



const testClientCreation = () => {
  console.log(`ANYTHING?? ${supabaseUrl.length}`);
  console.log(supabaseKey);
    const client: SupabaseClient = createClient(supabaseUrl, supabaseKey, options)

    // Verify if the Supabase URL and key are provided
    if (!supabaseUrl) throw new Error('supabaseUrl is required.')
    if (!supabaseKey) throw new Error('supabaseKey is required.')

    assert('hi', 'hi');
}

Deno.test('Client Creation Test', testClientCreation);