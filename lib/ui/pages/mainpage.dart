import '/ui/pages/homepage.dart';

import '../widgets/customBottomNav.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          buildContent(),
          customButtonNav()
        ],
      ),
    );
  }

  Widget buildContent(){
    return HomePage();
  }

  Widget customButtonNav(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: EdgeInsets.only(
            bottom: 30, left: defaultMargin, right: defaultMargin),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomBottomNavigation(imageUrl:'assets/icons/home.png', isSelected: true,),
            CustomBottomNavigation(imageUrl:'assets/icons/book.png'),
            CustomBottomNavigation(imageUrl:'assets/icons/credit_card.png'),
            CustomBottomNavigation(imageUrl:'assets/icons/settings.png'),
          ],
        ),
      ),
    );
  }
}