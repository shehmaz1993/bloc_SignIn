
abstract class SignInEvent {}
class SignInTextChanged extends SignInEvent{
    final String emailValue;
    final String passwordValue;
  SignInTextChanged(this.emailValue,this.passwordValue);
}
class SignInTextSubmitted extends SignInEvent{
  final  String email;
   final  String password;
  SignInTextSubmitted(this.email,this.password);
}
