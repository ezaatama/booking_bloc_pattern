import 'package:bwa_airplane/cubit/seat/seat_cubit.dart';
import 'package:bwa_airplane/models/destinations_model.dart';
import 'package:bwa_airplane/models/transaction_model.dart';
import 'package:bwa_airplane/ui/widgets/customButton.dart';
import 'package:bwa_airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';
import 'package:intl/intl.dart';
import 'checkout_page.dart';

class ChooseSeatPage extends StatelessWidget {
  
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [title(), setStatus(), selectedSeat(), checkOutButton()],
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        'Select Your\nFavorite Seat',
        style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
      ),
    );
  }

  Widget setStatus() {
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
                    image: AssetImage('assets/icons/available.png'))),
          ),
          Text(
            'Available',
            style: blackTextStyle,
          ),
          //Selected
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(left: 10, right: 6),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/selected.png'))),
          ),
          Text(
            'Selected',
            style: blackTextStyle,
          ),
          //Unavailable
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(left: 10, right: 6),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/unavailable.png'))),
          ),
          Text(
            'Unavailable',
            style: blackTextStyle,
          )
        ],
      ),
    );
  }

  Widget selectedSeat() {
    return BlocBuilder<SeatCubit, List<String>>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 30),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                  Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                  Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                  Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                  Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ))
                ],
              ),
              Container(
                //Seat 1
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: 'B1'),
                    SeatItem(id: 'A1'),
                    Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '1',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        )),
                    SeatItem(id: 'D1'),
                    SeatItem(id: 'C1'),
                  ],
                ),
              ),
              Container(
                //Seat 2
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: 'A2'),
                    SeatItem(id: 'B2'),
                    Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '2',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        )),
                    SeatItem(id: 'C2'),
                    SeatItem(id: 'D2')
                  ],
                ),
              ),
              Container(
                //Seat 3
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: 'A3'),
                    SeatItem(id: 'B3'),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '3',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(id: 'C3'),
                    SeatItem(id: 'D3')
                  ],
                ),
              ),
              Container(
                //Seat 4
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: 'A4'),
                    SeatItem(id: 'B4'),
                    Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '4',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        )),
                    SeatItem(id: 'C4'),
                    SeatItem(id: 'D4')
                  ],
                ),
              ),
              Container(
                //Seat 5
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: 'A5'),
                    SeatItem(id: 'B5'),
                    Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '5',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        )),
                    SeatItem(id: 'C5'),
                    SeatItem(id: 'D5')
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
                        style: greyTextStyle.copyWith(fontWeight: light)),
                    Text(
                      state.join(', '),
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
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
                        style: greyTextStyle.copyWith(fontWeight: light)),
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                          .format(state.length * destination.price),
                      style: purpleTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget checkOutButton() {
    return BlocBuilder<SeatCubit, List<String>>(
      builder: (context, state) {
        return CustomButton(
          title: 'Continue to Checkout',
          onPressed: () {

            int price = destination.price * state.length;

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => CheckoutPage(TransactionModel(
                          destination: destination,
                          amountOfTraveler: state.length,
                          selectedSeats: state.join(', '),
                          insurance: true,
                          refundable: false,
                          vat: 0.45,
                          price: price,
                          grandTotal: price + (price * 0.45).toInt()
                        ))));
          },
          margin: EdgeInsets.only(top: 30, bottom: 46),
        );
      },
    );
  }
}
