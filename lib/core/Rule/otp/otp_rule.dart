class OtpRule {}

extension OtpValidtion on OtpRule {
  String validateOtp(String value) {
    String enterOtp = "Please enter OTP";
    String invalidOtp = "Please enter 4 digit OTP";

    if (value == "") {
      return enterOtp;
    }

    if (value.length != 4) {
      return invalidOtp;
    }

    return "";
  }
}
