class NameRule {}

extension ValidateName on NameRule {
  String validateName(String value) {
    const String enterName = "Please enter full name";
    const String invalidName = "Please enter valid full name";
    const String minNameLength = "Full name length is too short";
    const String nameRegex = "^(?=.*[a-z]).{2,}";

    if (value == "") {
      return enterName;
    }

    if (value.length < 2) {
      return minNameLength;
    }

    if (RegExp(nameRegex).hasMatch(value) == false) {
      return invalidName;
    }
    return "";
  }
}

