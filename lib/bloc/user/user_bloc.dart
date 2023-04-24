import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<CoffeeBeansIncremented>((event, emit) {
      int newCount = max(state.numCoffeeBeans + event.numBeans, 0);
      emit(UserCoffeeBeans(newCount));
    });
  }
}