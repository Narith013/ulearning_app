import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/Register/bloc/register_events.dart';
import 'package:ulearning_app/pages/Register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates>{
  RegisterBloc(): super(const RegisterStates()){
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit){
    // print('user name ${event.userName}');
    emit(state.copyWith(userName: event.userName));
  }

   void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit){
    // print('email ${event.email}');
    emit(state.copyWith(email: event.email));
  }

   void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit){
    // print('password ${event.password}');
    emit(state.copyWith(password: event.password));
  }

   void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit){
    // print('re password ${event.rePassword}');
    emit(state.copyWith(rePassword: event.rePassword));
  }

}