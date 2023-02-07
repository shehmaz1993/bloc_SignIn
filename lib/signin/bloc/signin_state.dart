
import 'package:flutter/cupertino.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInValid  extends  SignInState{}
class SignInInvalid extends SignInState{
    final  String errorMessage;
     SignInInvalid( this.errorMessage);
}
class SignInLoading extends SignInState{

}
