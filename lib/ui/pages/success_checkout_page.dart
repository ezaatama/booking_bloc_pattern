import 'package:bwa_airplane/shared/theme.dart';
import 'package:bwa_airplane/ui/widgets/customButton.dart';
import 'package:flutter/material.dart';

class SuccessCheckout extends StatelessWidget {
  const SuccessCheckout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/reserve.png')
                )
              ),
            ),
            Text("Well Booked😍",
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold
              ),
            ),
            SizedBox(height: 10,),
            Text("Are you ready to explore the new\nworld of experiences?",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: "My Bookings", 
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, '/mainpage', (route) => false);
              },
              width: 220,
              margin: EdgeInsets.only(top: 50),
            )
          ],
        ),
      ),
    );
  }
}