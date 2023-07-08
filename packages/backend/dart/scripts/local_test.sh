supabase stop --no-backup
supabase start
dart test test/01_username_table_test.dart
dart test test/02_p2p_request_table_test.dart
dart test test/03_p2p_scheduling_table_test.dart