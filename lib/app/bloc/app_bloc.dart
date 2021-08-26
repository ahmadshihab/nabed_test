import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabed_test/data/repository/irepository.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  IRepository _repository;

  AppBloc(this._repository) : super(AppState.initail());

  @override
  AppState get initialState => AppState.initail();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is LoginState) {
      final result = await _repository.getIsLogin();
      yield state.rebuild((b) => b..loginState = result);
    }
  }
}
