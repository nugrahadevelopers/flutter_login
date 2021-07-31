import 'package:matel_login1/api_connection/api_connection.dart';
import 'package:matel_login1/auth/dao/user_dao.dart';
import 'package:matel_login1/auth/model/api_model.dart';
import 'package:matel_login1/auth/model/user_model.dart';

class UserRepository {
  final userDao = UserDao();

  Future<UserModel> authenticate({
    required String email,
    required String password,
  }) async {
    UserLoginModel userLoginModel = UserLoginModel(
      email: email,
      password: password,
    );

    TokenModel tokenModel = await getToken(userLoginModel);
    UserModel userModel = UserModel(
      id: 0,
      email: email,
      token: tokenModel.token,
    );

    return userModel;
  }

  Future<void> persistToken({required UserModel userModel}) async {
    await userDao.createUser(userModel);
  }

  Future<void> deleteToken({required int id}) async {
    await userDao.deleteUser(id);
  }

  Future<bool> hasToken() async {
    bool result = await userDao.checkUser(0);
    return result;
  }
}
