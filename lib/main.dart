import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'app/app.dart';
import 'injectoin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await iniGetIt();

  runApp(App());
}
