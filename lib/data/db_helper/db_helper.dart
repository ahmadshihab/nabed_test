import 'package:nabed_test/config/network_error.dart';

import 'db/database.dart';
import 'entite/user.dart';
import 'idp_helper.dart';

class DbHelper implements IDbHelper {
  Future<AppDatabase> _getInstDB() async {
    return await $FloorAppDatabase.databaseBuilder('userDB.db').build();
  }

  @override
  Future<void> signUp(User user) async {
    try {
      return await (await _getInstDB()).userDao.signUp(user);
    } catch (e) {
      print('user db db e is $e');
      throw Exception(e.toString());
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      User? user = await (await _getInstDB()).userDao.login(email, password);
      print(user);
      if (user != null) {
        return user;
      } else {
        throw NetworkException();
      }
      // return await (await _getInstDB()).userDao.login(email, password);
    } catch (e) {
      print('user db e is $e');
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<User?>> getUsers() async {
    try {
      return await (await _getInstDB()).userDao.getUsers();
    } catch (e) {
      print('user db e is $e');
      throw Exception(e.toString());
    }
  }
}
