class NewPasswordRule {}

extension ValidateNewPassword on NewPasswordRule {
  String validateNewPassword(String value) {
    if (value == "") {
      return "Please Enter New Password";
    }

    if (value.length < 4) {
      return "New Password must be atleast 8 characters.";
    }
    return "";
  }
}
