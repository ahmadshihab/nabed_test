import 'package:floor/floor.dart';

@entity
class UserProject {
  @primaryKey
  int? id;

  String? username;

  String? password;

  UserProject({
    this.id,
    this.username,
    this.password,
  });
}
