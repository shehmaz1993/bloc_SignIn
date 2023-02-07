import 'package:bloc_signin/signin/bloc/signin_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../homepage.dart';
import 'bloc/signin_bloc.dart';
import 'bloc/signin_state.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final List<Icon> iconsImage = [
    Icon(Icons.person),
    Icon(Icons.mail),
    Icon(Icons.phone_android),
    Icon(Icons.password_sharp)
  ];
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
        ),
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            // color: Colors.blue,
            child: Center(
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInInvalid) {
                      return Text(state.errorMessage,
                        style: const TextStyle(color: Colors.redAccent),);
                    }
                    else {
                      return Container();
                    }
                  },
                )
            ),
          ),

          emailTextBox(),

          passwordTextBox(),


          Padding(
            padding: const EdgeInsets.only(
                left: 22.0, top: 38.0, bottom: 0.0, right: 22.0),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if(state is SignInLoading){
                  return Center(child: CircularProgressIndicator(),);
                }
                return Container(
                  width: 266, //266.0,
                  height: 48.0, //48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color:(state is SignInValid)? Colors.lightBlue.shade500:Colors.grey,
                  ),
                  child: MaterialButton(
                    onPressed: ()  {
                      if(state is SignInValid){
                        BlocProvider.of<SignInBloc>(context).add(SignInTextSubmitted(emailController.text,passwordController.text));
                        Future.delayed(const Duration(milliseconds: 1500), () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => HomePage())
                          );

                        });



                      }

                    },
                    child: const FittedBox(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Sign In', style: TextStyle(color: Colors.white),),
                        )),
                  )
                );
              },
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 68.0, right: 68.0, top: 20.0),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: const Text('Forgot password?',
                      style: TextStyle(color: Colors.lightBlue),)

                ),
                const SizedBox(width: 10,),
                GestureDetector(
                    onTap: () {

                    },
                    child: const Text('create account!',
                      style: TextStyle(color: Colors.lightBlue),))
              ],
            ),
          )


        ],
      ),

    );
  }

  Widget emailTextBox() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 22.0, top: 18.0, bottom: 0.0, right: 22.0),
      child: Container(
        width: 266, //266.0,
        height: 48.0, //48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          // color: const Color(0xffe7ebee),
          border: Border.all(
              width: 2.0,
              color: Colors.lightBlue.shade300
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: TextField(
            //style:TextStyle(color: Colors.white)  ,
            controller: emailController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(

                icon: iconsImage[2],
                //iconColor: Colors.white,
                hintText: 'Email....',
                // hintStyle:TextStyle(color: Colors.white) ,

                border: InputBorder.none
              // labelText: hint,
            ),
            onChanged: (value){
              BlocProvider.of<SignInBloc>(context).add(SignInTextChanged(emailController.text,passwordController.text));
            },


          ),
        ),
      ),
    );
  }

  Widget passwordTextBox() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 22.0, top: 18.0, bottom: 0.0, right: 22.0),
      child: Container(
        width: 266, //266.0,
        height: 48.0, //48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          // color: const Color(0xffe7ebee),
          border: Border.all(
              width: 2.0,
              color: Colors.lightBlue.shade300
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(
                icon: iconsImage[3],
                hintText: 'password....',
                border: InputBorder.none

              // labelText: hint,
            ),

            onChanged: (value){
              BlocProvider.of<SignInBloc>(context).add(SignInTextChanged(emailController.text,passwordController.text));
            },
          ),
        ),
      ),
    );
  }
}
