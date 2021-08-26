import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabed_test/data/db_helper/entite/user.dart';
import 'package:nabed_test/data/repository/irepository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  IRepository _repository;

  AuthBloc(this._repository) : super(AuthState.initail());

  @override
  AuthState get initialState => AuthState.initail();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Register) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false);

        await _repository
            .signUp(User(email: event.email, password: event.password));
        print('Register Success data ');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true);
      } catch (e) {
        print('Register Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false);
      }
    }

    if (event is Login) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false);

        final data = await _repository.login(event.email, event.password);
        print('Login Success data ${data}');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true);
      } catch (e) {
        print('Login Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false);
      }
    }
  }
}
