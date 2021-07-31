class UserModel {
  int id;
  String email;
  String token;

  UserModel({
    this.id = 0,
    this.email = "noEmail",
    this.token = "noToken",
  });

  factory UserModel.fromDatabaseJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      email: data['email'],
      token: data['accessToken'],
    );
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      "id": id,
      "email": email,
      "token": token,
    };
  }
}
