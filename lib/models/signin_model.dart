class SigninModel {
  final String message;
  final String token;
  SigninModel({
    required this.message,
    required this.token,
  });
  factory SigninModel.fromJson(Map<String, dynamic> json) {
    return SigninModel(
      message: json['message'],
      token: json['token'],
    );
  }
}