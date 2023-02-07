import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_signin/signin/bloc/signin_event.dart';
import 'package:bloc_signin/signin/bloc/signin_state.dart';
import 'package:email_validator/email_validator.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInTextChanged>((event, emit) {
      if( EmailValidator.validate(event.emailValue)==false ){
        print('email validator');
        emit(SignInInvalid('Enter a valid email and password!'));
      }
      else if(event.passwordValue.length<8){
        print('password validator');
        emit(SignInInvalid('Enter a valid password!'));
      }
      else{
        emit(SignInValid());
      }
    });
    on<SignInTextSubmitted>((event, emit) {{
        emit(SignInLoading());
    }
    });
  }
}
