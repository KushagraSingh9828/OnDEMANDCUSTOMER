class ConfirmPasswordRule {}

extension ValidateConfirmPassword on ConfirmPasswordRule {
  String validateConfirmPassword(String value) {
    if (value == "") {
      return "Please Enter Confirm Password";
    }

    if (value.length < 4) {
      return "Confirm Password must be atleast 8 characters.";
    }
    return "";
  }
}
