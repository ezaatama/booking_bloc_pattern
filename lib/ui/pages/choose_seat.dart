import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          setStatus(),
          selectedSeat()
        ],
      ),
    );
  }

  Widget title(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        'Select Your\nFavorite Seat',
        style: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold
        ),
      ),
    );
  }

  Widget setStatus(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        children: [
          //Available
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/available.png')
              )
            ),
          ),
          Text('Available',
            style: blackTextStyle,
          ),
          //Selected
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(left: 10, right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/selected.png')
              )
            ),
          ),
          Text('Selected',
            style: blackTextStyle,
          ),
          //Unavailable
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(left: 10,right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/unavailable.png')
              )
            ),
          ),
          Text('Unavailable',
            style: blackTextStyle,
          )
        ],
      ),
    );
  }

  Widget selectedSeat(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18)
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text('A',
                style: greyTextStyle.copyWith(
                  fontSize: 16
                ),
              ),
            )
          ),
          Expanded(
            child: Center(
              child: Text('B',
                style: greyTextStyle.copyWith(
                  fontSize: 16
                ),
              ),
            )
          ),
          Expanded(
            child: Center(
              child: Text('',
                style: greyTextStyle.copyWith(
                  fontSize: 16
                ),
              ),
            )
          ),
          Expanded(
            child: Center(
              child: Text('C',
                style: greyTextStyle.copyWith(
                  fontSize: 16
                ),
              ),
            )
          ),
          Expanded(
            child: Center(
              child: Text('D',
                style: greyTextStyle.copyWith(
                  fontSize: 16
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}