import 'package:primala/app/core/utilities/email_modifier_algo.dart';
// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("successfully modifies a variety of emails", () {
    String email1 = "example.email1@example.com";
    String modifiedEmail1 = EmailModifierAlgo.call(email1);
    expect(modifiedEmail1, "example_email1");

    String email2 = "user.name2@example.com";
    String modifiedEmail2 = EmailModifierAlgo.call(email2);
    expect(modifiedEmail2, "user_name2");

    String email3 = "test-email3@example.com";
    String modifiedEmail3 = EmailModifierAlgo.call(email3);
    expect(modifiedEmail3, "test-email3");

    String email4 = "example.email1234567890@example.com";
    String modifiedEmail4 = EmailModifierAlgo.call(email4);
    expect(modifiedEmail4, "example_email1234567890");

    String email5 = "john.doe1234567890@example.com";
    String modifiedEmail5 = EmailModifierAlgo.call(email5);
    expect(modifiedEmail5, "john_doe1234567890");

    String email6 = "jane.doe1234567890zafaer24rerfsd@icloud.com";
    String modifiedEmail6 = EmailModifierAlgo.call(email6);
    expect(modifiedEmail6, "jane_doe1234567");

    String email7 = "kwuvmn2aoi@privaterelay.appleid.com";
    String modifiedEmail7 = EmailModifierAlgo.call(email7);
    expect(modifiedEmail7, "kwuvmn2aoi");
  });
}
