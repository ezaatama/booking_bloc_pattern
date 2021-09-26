import 'package:bwa_airplane/ui/widgets/customButton.dart';
import 'package:bwa_airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'checkout_page.dart';

class ChooseSeatPage extends StatefulWidget {
  const ChooseSeatPage({ Key? key }) : super(key: key);

  @override
  _ChooseSeatPageState createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          setStatus(),
          selectedSeat(),
          checkOutButton()
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
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 48,
                height: 48,
                child: Center(
                  child: Text('A',
                    style: greyTextStyle.copyWith(
                      fontSize: 16
                    ),
                  ),
                )
              ),
              Container(
                width: 48,
                height: 48,
                child: Center(
                  child: Text('B',
                    style: greyTextStyle.copyWith(
                      fontSize: 16
                    ),
                  ),
                )
              ),
              Container(
                width: 48,
                height: 48,
                child: Center(
                  child: Text('',
                    style: greyTextStyle.copyWith(
                      fontSize: 16
                    ),
                  ),
                )
              ),
              Container(
                width: 48,
                height: 48,
                child: Center(
                  child: Text('C',
                    style: greyTextStyle.copyWith(
                      fontSize: 16
                    ),
                  ),
                )
              ),
              Container(
                width: 48,
                height: 48,
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
          Container( //Seat 1
            margin: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 2),
                SeatItem(status: 2),
                Container(
                  width: 48,
                  height: 48,
                   child: Center(
                    child: Text('1',
                      style: greyTextStyle.copyWith(
                        fontSize: 16
                      ),
                    ),
                  )
                ),
                SeatItem(status: 0),
                SeatItem(status: 2)
              ],
            ),
          ),
          Container( //Seat 2
            margin: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 0),
                Container(
                  width: 48,
                  height: 48,
                   child: Center(
                    child: Text('2',
                      style: greyTextStyle.copyWith(
                        fontSize: 16
                      ),
                    ),
                  )
                ),
                SeatItem(status: 0),
                SeatItem(status: 2)
              ],
            ),
          ),
          Container( //Seat 3
            margin: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 1),
                SeatItem(status: 1),
                Container(
                  width: 48,
                  height: 48,
                   child: Center(
                    child: Text('3',
                      style: greyTextStyle.copyWith(
                        fontSize: 16
                      ),
                    ),
                  )
                ),
                SeatItem(status: 0),
                SeatItem(status: 0)
              ],
            ),
          ),
          Container( //Seat 4
            margin: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 2),
                Container(
                  width: 48,
                  height: 48,
                   child: Center(
                    child: Text('4',
                      style: greyTextStyle.copyWith(
                        fontSize: 16
                      ),
                    ),
                  )
                ),
                SeatItem(status: 0),
                SeatItem(status: 0)
              ],
            ),
          ),
          Container( //Seat 5
            margin: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 0),
                Container(
                  width: 48,
                  height: 48,
                   child: Center(
                    child: Text('5',
                      style: greyTextStyle.copyWith(
                        fontSize: 16
                      ),
                    ),
                  )
                ),
                SeatItem(status: 2),
                SeatItem(status: 0)
              ],
            ),
          ),
          //Your Seat
           Container(
             margin: EdgeInsets.only(top: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Your Seat',
                  style: greyTextStyle.copyWith(
                    fontWeight: light
                  )
                 ),
                 Text('A3, B3',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium
                  ),
                 )
               ],
             ),
           ),
           //Total Seat
           Container(
             margin: EdgeInsets.only(top: 16),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Total',
                  style: greyTextStyle.copyWith(
                    fontWeight: light
                  )
                 ),
                 Text('IDR 540.000.000',
                  style: purpleTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium
                  ),
                 )
               ],
             ),
           )
        ],
      ),
    );
  }

  Widget checkOutButton(){
    return CustomButton(
      title: 'Continue to Checkout', 
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => CheckoutPage()));
      },
      margin: EdgeInsets.only(top: 30, bottom: 46),
    );
  }
}