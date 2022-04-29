class ComparePasswordRule {}

extension ComparePassword on ComparePasswordRule {
  String comparePassword(String pwd1, String pwd2) {
    if (pwd1 != pwd2) {
      return "Password and confirm password must be the same";
    }
    return "";
  }
}
