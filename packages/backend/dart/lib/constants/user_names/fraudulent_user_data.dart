import '/util/usernames/supabase_user_row.dart';
import '../general/user_data_constants.dart';

class FraudulentUserData {
  static firstFraud() {
    return UsernamesRow(
      uid: UserDataConstants.user1UID,
      firstName: UserDataConstants.user1FirstName,
      lastName: UserDataConstants.user1LastName,
    );
  }
}
