abstract interface class IAuthRepo {
  String get name;

  Future<String> signInSms(String phone);

  Future<(String accessToken, String refreshToken)> sendSms(
      String phone, String code);
}
