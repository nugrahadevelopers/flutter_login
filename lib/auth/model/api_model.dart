class UserLoginModel {
  String email;
  String password;

  UserLoginModel({
    this.email = "noEmail",
    this.password = "noPassword",
  });

  Map<String, dynamic> toDatabaseJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}

class TokenModel {
  String token;

  TokenModel({this.token = "noToken"});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['accessToken'],
    );
  }
}
