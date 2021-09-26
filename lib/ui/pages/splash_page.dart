import 'package:bwa_airplane/cubit/auth/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    Timer(Duration(seconds: 3),
      () {

        User? user = FirebaseAuth.instance.currentUser;

        if(user == null){
          Navigator.pushNamedAndRemoveUntil(context, '/get-started', (route) => false);
        } else {
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Navigator.pushNamedAndRemoveUntil(context, '/mainpage', (route) => false);
        }
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/icons/holidays.png'))
              ),
            ),
            Text("Switzerland",
              style: whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
                letterSpacing: 10
              ),
            )
          ],
        ),
      ),
    );
  }
}