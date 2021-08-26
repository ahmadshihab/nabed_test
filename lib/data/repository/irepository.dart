import 'package:nabed_test/data/db_helper/entite/user.dart';
import 'package:nabed_test/model/image_card/image_list.dart';

abstract class IRepository {
  Future<void> signUp(User user);

  Future<User?> login(String email, String password);

  Future<ImageList?> getImages(int pageNumber);

  Future<void> logout();

  Future<bool?> getIsLogin();
}
