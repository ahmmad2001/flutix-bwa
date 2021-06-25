import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix_bwa/models/models.dart';
import 'package:flutix_bwa/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      Users users = await UserServices.getUser(event.id);

      yield UserLoaded(users);
    } else if (event is SignOut) {
      yield UserInitial();
    }
  }
}
