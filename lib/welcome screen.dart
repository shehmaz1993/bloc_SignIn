import 'package:bloc_signin/signin/bloc/signin_bloc.dart';
import 'package:bloc_signin/signin/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          //color: Colors.green,
          height: 130,
          width: 270,
          child: Column(
            children: [
              CupertinoButton(
                  color: Colors.blue,
                  child: const Text('Sign In with Email'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>
                            BlocProvider(
                              create: (context) => SignInBloc(),
                              child: SignInPage(),
                            ))
                    );
                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  color: Colors.blue,
                  child: const Text('Sign In with Google'),
                  onPressed: () {

                  })
            ],
          ),
        ),
      ),
    );
  }
}
