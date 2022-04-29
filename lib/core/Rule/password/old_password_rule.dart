import 'dart:developer';

class OldPasswordRule {}

extension ValidateOldPassword on OldPasswordRule {
  String validateOldPassword(String value) {
    log("value");
    log(value);
    if (value.isEmpty) {
      log("value23423");
      return "Please Enter Old Password";
    }

    if (value == "") {
      log("blankk..");
      return "Please Enter Old Password";
    }

    if (value.length < 4) {
      return "Old Password must be atleast 8 characters.";
    }
    return "";
  }
}
