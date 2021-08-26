import 'db/database.dart';
import 'entite/user.dart';

abstract class IDbHelper {
  Future<void> signUp(User user);

  Future<User?> login(String email, String password);

  Future<List<User?>> getUsers();

}
