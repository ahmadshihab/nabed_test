import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabed_test/app/bloc/app_event.dart';
import 'package:nabed_test/config/colors.dart';

import 'package:nabed_test/config/size_config.dart';
import 'package:nabed_test/pages/auth/bloc/auth_event.dart';
import 'package:nabed_test/pages/auth/login/login.dart';
import 'package:nabed_test/pages/auth/signup/signup.dart';
import 'package:nabed_test/pages/home/home.dart';

import '../injectoin.dart';
import 'bloc/app_bloc.dart';
import 'bloc/app_state.dart';

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _bloc = sl<AppBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(LoginState());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, AppState state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            builder: (context, child) {
              SizeConfig.init(context);
              return child!;
            },
            theme: ThemeData(
              accentColor: PRIMARY,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: state.loginState ? HomePage() : LoginPage(),
          );
        });
  }
}
