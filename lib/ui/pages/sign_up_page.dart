import 'package:bwa_airplane/ui/widgets/customButton.dart';
import 'package:bwa_airplane/ui/widgets/customTextForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            _title(),
            _inputSection()
          ],
        ),
      )
    );
  }

  Widget _title(){
    return Container(
      margin: const EdgeInsets.only(top:30),
      child: Text('Join us and get\nyour next journey',
        style: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold
        ),
      ),
    );
  }

  Widget _inputSection(){
    Widget nameInput(){
      return CustomTextField(title: 'Full Name', hintText: 'Your full name');
    }
     Widget emailInput(){
      return CustomTextField(title: 'Email Addresss', hintText: 'Your email address');
    }
    Widget passwordInput(){
      return CustomTextField(title: 'Password', hintText: 'Your password', obscureText: true,);
    }

    Widget hobbyInput(){
      return CustomTextField(title: 'Hobby', hintText: 'Your hobby');
    }

    Widget submitButton(){
      return CustomButton(title: 'Get Started', onPressed: (){
          Navigator.pushNamed(context, '/mainpage');
        }
      );
    }

    Widget termsButton(){
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          top: 50,
          bottom: 73
        ),
        child: Text('Terms and Conditions',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top:30),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(defaultRadius)
      ),
      child: Column(
        children: [
          nameInput(),
          emailInput(),
          passwordInput(),
          hobbyInput(),
          submitButton(),
          termsButton()
        ],
      ),
    );

  }
}