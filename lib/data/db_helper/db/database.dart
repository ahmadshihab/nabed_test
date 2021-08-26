import 'dart:async';
import 'package:floor/floor.dart';
import 'package:nabed_test/data/db_helper/dao/user_dao.dart';
import 'package:nabed_test/data/db_helper/entite/user.dart';
import 'package:nabed_test/data/db_helper/entite/userProject.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [User, UserProject])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
