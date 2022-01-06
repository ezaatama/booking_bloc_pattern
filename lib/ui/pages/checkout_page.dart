import 'package:bwa_airplane/cubit/auth/auth_cubit.dart';
import 'package:bwa_airplane/cubit/transaction/transaction_cubit.dart';
import 'package:bwa_airplane/models/transaction_model.dart';
import 'package:bwa_airplane/shared/theme.dart';
import 'package:bwa_airplane/ui/pages/success_checkout_page.dart';
import 'package:bwa_airplane/ui/widgets/booking_details_item.dart';
import 'package:bwa_airplane/ui/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {

  final TransactionModel transaction;

  const CheckoutPage(this.transaction, { Key? key }) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          termsButton()
        ],
      ),
    );
  }

  Widget route() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Container(
            width: 291,
            height: 65,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/checkout.png'))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CGK',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold)),
                  Text(
                    'Tangerang',
                    style: greyTextStyle.copyWith(fontWeight: light),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('TLC',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold)),
                  Text(
                    'Ciliwung',
                    style: greyTextStyle.copyWith(fontWeight: light),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget bookingDetails() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Destination Tile
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        image: NetworkImage(
                            widget.transaction.destination.imageUrl),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.transaction.destination.name,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.transaction.destination.city,
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/star.png'))),
                  ),
                  Text(
                    widget.transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          //Booking Details Text
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          //Booking Details Item
          BookingDetailsItem(
            title: 'Traveler',
            valueText: '${widget.transaction.amountOfTraveler} person',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Seat',
            valueText: widget.transaction.selectedSeats,
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
              title: 'Insurance',
              valueText: widget.transaction.insurance ? 'YES' : 'NO',
              valueColor:
                  widget.transaction.insurance ? kGreenColor : kRedColor),
          BookingDetailsItem(
              title: 'Refundable',
              valueText: widget.transaction.refundable ? 'YES' : 'NO',
              valueColor:
                  widget.transaction.refundable ? kGreenColor : kRedColor),
          BookingDetailsItem(
            title: 'VAT',
            valueText: '${(widget.transaction.vat * 100).toStringAsFixed(0)}%',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Price',
            valueText: NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(widget.transaction.price),
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Grand Total',
            valueText: NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(widget.transaction.grandTotal),
            valueColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  Widget paymentDetails() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Details',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(18)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/credit_card.png'))),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(state.user.balance),
                                style: blackTextStyle.copyWith(
                                    fontWeight: semiBold, fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Current Balance',
                                style:
                                    greyTextStyle.copyWith(fontWeight: light),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }

  Widget payNowButton() {
    return BlocConsumer<TransactionCubit, TransactionState>(
      listener: (context, state) {
         if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: kRedColor,
                content: Text(
              state.error,
            )));
          }
      },
      builder: (context, state) {
        if(state is TransactionLoading){
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            child: CircularProgressIndicator()
          );
        }
        return CustomButton(
          title: 'Pay Now',
          onPressed: () {
            context.read<TransactionCubit>().createTransaction(widget.transaction);
          },
          margin: EdgeInsets.only(top: 30),
        );
      },
    );
  }

  Widget termsButton() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 50, bottom: 73),
      child: Text(
        'Terms and Conditions',
        style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline),
      ),
    );
  }
}