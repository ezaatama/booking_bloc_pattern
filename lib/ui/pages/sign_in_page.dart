import 'package:bwa_airplane/cubit/auth/auth_cubit.dart';
import 'package:bwa_airplane/ui/widgets/customButton.dart';
import 'package:bwa_airplane/ui/widgets/customTextForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class SignIn extends StatefulWidget {
  SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [_title(), _inputSection()],
          ),
        ));
  }

  Widget _title() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Text(
        'Sign In with your\nexisting account',
        style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
      ),
    );
  }

  Widget _inputSection() {
    Widget emailInput() {
      return CustomTextField(
        title: 'Email Addresss',
        hintText: 'Your email address',
        controller: emailController,
      );
    }

    Widget passwordInput() {
      return CustomTextField(
        title: 'Password',
        hintText: 'Your password',
        obscureText: true,
        controller: passwordController,
      );
    }

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/mainpage', (route) => false);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: kRedColor,
                content: Text(
              state.error,
            )));
          }
        },
        builder: (context, state) {
          if(state is AuthLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
              title: 'Sign In',
              onPressed: () {
                context.read<AuthCubit>().signIn(email: emailController.text, password: passwordController.text,);
              });
        },
      );
    }

    Widget signUpButton() {
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50, bottom: 73),
          child: Text(
            "Don't have an account? Sign Up",
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius)),
      child: Column(
        children: [
          emailInput(),
          passwordInput(),
          submitButton(),
          signUpButton()
        ],
      ),
    );
  }
}