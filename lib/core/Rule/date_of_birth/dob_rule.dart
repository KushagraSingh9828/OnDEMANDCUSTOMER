class DateOfBirthRule {}

extension ValidateDob on DateOfBirthRule {
  String validateDateOfBirth(String value) {
    if (value == "") {
      return "Please select date of birth";
    }
    return "";
  }
}
