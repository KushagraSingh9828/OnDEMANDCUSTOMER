class PasswordRule {}

extension PasswordValidation on PasswordRule {
  String validatePassword(String value) {
    if (value == "") {
      return "Please Enter Password";
    }

    if (value.length < 4) {
      return "Password must be atleast 8 characters.";
    }

    if (isValid == false) {
      return "Password must have at least 8 Characters and at least 1 Uppercase Character, Lowercase Character, 1 Numeric and 1 Special Character";
    }
    return "";
  }

  bool isValid(String value) {
    // ignore: valid_regexps
    if (RegExp("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~\$^+=<>]).{8,20}\$")
            .hasMatch(value) ==
        true) {
      return true;
    } else {
      return false;
    }
  }
}
