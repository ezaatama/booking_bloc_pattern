import 'package:bwa_airplane/cubit/page_cubit.dart';
import 'package:bwa_airplane/ui/pages/setting_page.dart';
import 'package:bwa_airplane/ui/pages/transaction_page.dart';
import 'package:bwa_airplane/ui/pages/wallet_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/pages/homepage.dart';

import '../widgets/customBottomNav.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [buildContent(currentIndex), customButtonNav()],
          ),
        );
      },
    );
  }

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();        
      case 1:
        return TransactionPage();
      case 2:
        return WalletPage();
      case 3:
        return SettingPage();
      default:
        return HomePage();
    }

  }

  Widget customButtonNav() {
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
            CustomBottomNavigation(
              index: 0,
              imageUrl: 'assets/icons/home.png',
            ),
            CustomBottomNavigation(index: 1, imageUrl: 'assets/icons/book.png'),
            CustomBottomNavigation(index: 2, imageUrl: 'assets/icons/credit_card.png'),
            CustomBottomNavigation(index: 3, imageUrl: 'assets/icons/settings.png'),
          ],
        ),
      ),
    );
  }
}
