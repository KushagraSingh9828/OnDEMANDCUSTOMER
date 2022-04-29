class LastNameRule {}

extension ValidateLastName on LastNameRule {
  String validateLastName(String value) {
    const String nameRegex = "^(?=.*[a-z]).{2,}";

    if (value == "") {
      return "Please enter last name";
    }

    if (RegExp(nameRegex).hasMatch(value) == false) {
      return "Please enter valid last name";
    }
    return "";
  }
}
