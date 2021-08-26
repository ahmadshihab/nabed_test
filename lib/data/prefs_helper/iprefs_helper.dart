import 'package:nabed_test/data/db_helper/entite/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IPrefsHelper {
  Future<SharedPreferences> getPrefs();

  Future<void> saveUser(User user, bool active);

  Future<String?> getUser();

  Future<bool?> logout();

  Future<bool?> getIsLogin();


}
