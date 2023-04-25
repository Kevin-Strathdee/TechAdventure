import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_adventure/data/minigame.dart';
import 'package:tech_adventure/data/place.dart';
import 'package:tech_adventure/data/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserRequested>((event, emit) {
      emit(UserLoadSuccess(getMockUser()));
    });
  }

  //Testing Data
  User getMockUser(){
    return User(1, "max.mustemann@jambit.com", "MadMax", "Max", "Mustermann", [getMockPlace()], "image", 300);
  }

  User getMockUser2(){
    return User(2, "grixon0@yahoo.com", "Garey", "Garey", "Rixon", [], "image", 0);
  }

  Place getMockPlace() {
    return Place(1, "Street", getMockUser2(), Minigame("DiceRolling", 5),"confrence room", "image", "tdb");
  }
}