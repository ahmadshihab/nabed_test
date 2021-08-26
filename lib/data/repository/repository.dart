import 'dart:io';

import 'package:nabed_test/config/chache_manager.dart';
import 'package:nabed_test/data/db_helper/entite/user.dart';
import 'package:nabed_test/data/db_helper/idp_helper.dart';
import 'package:nabed_test/data/http_helper/ihttpe_helper.dart';
import 'package:nabed_test/data/prefs_helper/iprefs_helper.dart';
import 'package:nabed_test/model/image_card/image_list.dart';

import 'irepository.dart';

class Repository implements IRepository {
  IHttpHelper _ihttpHelper;
  IPrefsHelper _iprefHelper;
  IDbHelper _iDbHelper;
  CustomCacheManager cacheManager = CustomCacheManager();

  Repository(this._ihttpHelper, this._iprefHelper, this._iDbHelper);

  @override
  Future<User?> login(String email, String password) async {
    User? user = await _iDbHelper.login(email, password);
    _iprefHelper.saveUser(User(email: email, password: password), true);

    return user;
  }

  @override
  Future<void> signUp(User user) async {
    final List<User?> result = await _iDbHelper.getUsers();

    if (result == null || result.isEmpty) {
      _iDbHelper.signUp(user);
    } else {
      for (var item in result) {
        if (item!.email == user.email) {
          print('Exception Exception');
          throw Exception("");
        }
      }
      _iDbHelper.signUp(user);
      _iprefHelper.saveUser(user, true);
    }
  }

  @override
  Future<ImageList?> getImages(int pageNumber) async {
    ImageList? imageList = await _ihttpHelper.getImages(pageNumber);

    // for (var i = 0; i < imageList!.hits.length; i++) {
    //   await cacheManager.cacheImage(url: imageList.hits[i].userImageURL);
    // }

    return _ihttpHelper.getImages(pageNumber);
  }

  @override
  Future<void> logout() async {
    String? email = await _iprefHelper.getUser();
    _iprefHelper.logout();
  }

  @override
  Future<bool?> getIsLogin() async {
    return await _iprefHelper.getIsLogin();
  }
}
