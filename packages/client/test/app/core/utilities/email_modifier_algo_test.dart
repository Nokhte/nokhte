import 'package:primala/app/core/utilities/misc_algos.dart';
// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("successfully modifies a variety of emails", () {
    String email1 = "example.email1@example.com";
    String modifiedEmail1 = MiscAlgos.deriveUsernameFromEmail(email1);
    expect(modifiedEmail1, "example_email1");

    String email2 = "user.name2@example.com";
    String modifiedEmail2 = MiscAlgos.deriveUsernameFromEmail(email2);
    expect(modifiedEmail2, "user_name2");

    String email3 = "test-email3@example.com";
    String modifiedEmail3 = MiscAlgos.deriveUsernameFromEmail(email3);
    expect(modifiedEmail3, "test-email3");

    String email4 = "example.email1234567890@example.com";
    String modifiedEmail4 = MiscAlgos.deriveUsernameFromEmail(email4);
    expect(modifiedEmail4, "example_email1234567890");

    String email5 = "john.doe1234567890@example.com";
    String modifiedEmail5 = MiscAlgos.deriveUsernameFromEmail(email5);
    expect(modifiedEmail5, "john_doe1234567890");

    String email6 = "jane.doe1234567890zafaer24rerfsd@icloud.com";
    String modifiedEmail6 = MiscAlgos.deriveUsernameFromEmail(email6);
    expect(modifiedEmail6, "jane_doe1234567");

    String email7 = "kwuvmn2aoi@privaterelay.appleid.com";
    String modifiedEmail7 = MiscAlgos.deriveUsernameFromEmail(email7);
    expect(modifiedEmail7, "kwuvmn2aoi");
  });
}
