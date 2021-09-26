import 'package:bwa_airplane/shared/theme.dart';
import 'package:bwa_airplane/ui/pages/success_checkout_page.dart';
import 'package:bwa_airplane/ui/widgets/booking_details_item.dart';
import 'package:bwa_airplane/ui/widgets/customButton.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [route(), bookingDetails(), paymentDetails(), payNowButton(), termsButton()],
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
                        image: AssetImage('assets/images/swiss_1.jpg'),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jungfrau',
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Bern and Valais',
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
                    '4.8',
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
            valueText: '2 Person',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Seat',
            valueText: 'A3 B3',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Insurance',
            valueText: 'YES',
            valueColor: kGreenColor,
          ),
          BookingDetailsItem(
            title: 'Refundable',
            valueText: 'NO',
            valueColor: kRedColor,
          ),
          BookingDetailsItem(
            title: 'VAT',
            valueText: '45%',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Price',
            valueText: 'IDR 8.500.690',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Grand Total',
            valueText: 'IDR 12.000.000',
            valueColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  Widget paymentDetails() {
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
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
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
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                      'IDR 80.400.000',
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Current Balance',
                      style: greyTextStyle.copyWith(fontWeight: light),
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

  Widget payNowButton(){
    return CustomButton(
      title: 'Pay Now', 
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => SuccessCheckout()));
      },
      margin: EdgeInsets.only(top: 30),
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
}
