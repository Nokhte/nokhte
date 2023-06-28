class EmailModifierAlgo {
  static String call(String email) {
    int atIndex = email.indexOf('@');
    String username = email.substring(0, atIndex);

    // Shorten the username if it exceeds 15 characters and if it's an iCloud relay email
    if (username.length > 15 &&
        (email.endsWith("@icloud.com") || email.endsWith("appleid.com"))) {
      if (email.endsWith("@icloud.com")) {
        username = username.substring(0, 15);
      } else {
        username = username.substring(0, -2);
      }
    }

    String modifiedUsername = username.replaceAll('.', '_');
    String modifiedEmail = modifiedUsername;

    return modifiedEmail;
  }
}
