import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String? email;

  String? password;

  User({
    this.id,
    this.email,
    this.password,
  });
}
