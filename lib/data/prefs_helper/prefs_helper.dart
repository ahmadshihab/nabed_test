import 'package:nabed_test/config/constants.dart';
import 'package:nabed_test/data/db_helper/entite/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'iprefs_helper.dart';

class PrefsHelper implements IPrefsHelper {
  @override
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveUser(User user, bool active) async {
    (await getPrefs()).setString(EMAIL, user.email ?? "");
    if (active) {
      (await getPrefs()).setBool(IS_LOGIN, true);
    }
  }

  @override
  Future<bool?> logout() async {
    // TODO: implement logout

    (await getPrefs()).setBool(IS_LOGIN, false);
  }

  @override
  Future<String?> getUser() async {
    return ((await getPrefs()).getString(EMAIL));
  }

  @override
  Future<bool> getIsLogin() async {
    // TODO: implement getIsLogin
    return (await getPrefs()).getBool(IS_LOGIN) ?? false;
  }
}
