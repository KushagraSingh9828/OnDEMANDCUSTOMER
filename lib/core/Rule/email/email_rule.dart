class EmailRule {}

extension ValidateMail on EmailRule {
  String validateEmail(String value) {
    const String enterEmail = "Please Enter Email Id";
    const String enterValidEmail = "Please Enter Valid Email Id";
    const String emailFormat =
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}";
    if (value.isEmpty) {
      return enterEmail;
    }

    if (value.length < 5) {
      return enterValidEmail;
    }

    if (RegExp(emailFormat).hasMatch(value) == false) {
      return enterValidEmail;
    }
    return "";
  }
}
