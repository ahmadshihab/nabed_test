import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nabed_test/app/bloc/app_bloc.dart';
import 'package:nabed_test/pages/auth/bloc/auth_bloc.dart';
import 'package:nabed_test/pages/home/bloc/home_bloc.dart';

import 'config/constants.dart';
import 'data/db_helper/db_helper.dart';
import 'data/db_helper/idp_helper.dart';
import 'data/http_helper/http_helper.dart';
import 'data/http_helper/ihttpe_helper.dart';
import 'data/prefs_helper/iprefs_helper.dart';
import 'data/prefs_helper/prefs_helper.dart';
import 'data/repository/irepository.dart';
import 'data/repository/repository.dart';

final sl = GetIt.instance;

Future iniGetIt() async {
  sl.registerLazySingleton(() => ((Dio(BaseOptions(
      baseUrl: BaseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "charset": "utf-8",
        "Accept-Charset": "utf-8"
      },
      responseType: ResponseType.plain)))));

  // data
  sl.registerLazySingleton<IDbHelper>(() => DbHelper());
  sl.registerLazySingleton<IPrefsHelper>(() => PrefsHelper());
  sl.registerLazySingleton<IHttpHelper>(() => HttpHelper(sl()));
  sl.registerLazySingleton<IRepository>(() => Repository(sl(), sl(), sl()));

  /// AppBloc
  sl.registerFactory(() => AppBloc(sl()));

  /// AuthBloc
  sl.registerFactory(() => AuthBloc(sl()));

  /// HomeBloc
  sl.registerFactory(() => HomeBloc(sl()));
}
