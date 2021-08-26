import 'package:floor/floor.dart';
import 'package:nabed_test/data/db_helper/entite/user.dart';

@dao
abstract class UserDao {
  @insert
  Future<void> signUp(User user);

  @Query("SELECT * FROM User WHERE email = :email and password = :password")
  Future<User?> login(String email, String password);

  @Query('SELECT * FROM User')
  Future<List<User?>> getUsers();
}
