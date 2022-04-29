class FirstNameRule {}

extension ValidateFirstName on FirstNameRule {
  String validateFirstName(String value) {
    const String nameRegex = "^(?=.*[a-z]).{2,}";

    if (value == "") {
      return "Please enter first name";
    }

    if (RegExp(nameRegex).hasMatch(value) == false) {
      return "Please enter valid first name";
    }
    return "";
  }
}
