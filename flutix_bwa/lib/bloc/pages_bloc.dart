import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pages_event.dart';
part 'pages_state.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  PagesState get initialState => OnInitialPage();

  @override
  Stream<PagesState> mapEventToState(
    PagesEvent event,
  ) async* {
    if (event is GotoSplashPage) {
      yield OnSplashPage();
    } else if (event is GotoLoginPage) {
      yield OnLoginPage();
    } else if (event is GotoMainPage) {
      yield OnMainPage();
    }
  }
}
