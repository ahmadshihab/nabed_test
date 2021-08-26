import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabed_test/data/db_helper/entite/user.dart';
import 'package:nabed_test/data/repository/irepository.dart';
import 'package:nabed_test/pages/home/bloc/home_event.dart';
import 'package:nabed_test/pages/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentPage = 1;

  IRepository _repository;

  HomeBloc(this._repository) : super(HomeState.initail());

  @override
  HomeState get initialState => HomeState.initail();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetImages) {
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..images.replace([]));
        final data = await _repository.getImages(currentPage);
        print('GetContent Success data ${data}');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..images.replace(data!.hits));
      } catch (e) {
        print('GetContent Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..images.replace([]));
      }
    }

    if (event is GetNext) {
      currentPage++;
      print(state.images.length);

      final data = await _repository.getImages(currentPage);

      if (data != null) {
        yield state.rebuild((b) => b..hasReachedEndOfResults = false);
        final data = await _repository.getImages(currentPage);

        yield state.rebuild((b) => b
          ..hasReachedEndOfResults = true
          ..images.addAll(data!.hits));
      } else {
        yield state.rebuild((b) => b..isLoading = false);
        yield state.rebuild((b) => b..hasReachedEndOfResults = true);
      }
    }

    if (event is Logout) {
      await _repository.logout();

      yield state.rebuild((b) => b
        ..isLoading = true
        ..error = ""
        ..isLogout = true);
    }
  }
}
