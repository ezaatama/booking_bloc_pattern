import 'package:bwa_airplane/models/destinations_model.dart';
import 'package:intl/intl.dart';

import '/ui/pages/choose_seat.dart';
import '/ui/widgets/customButton.dart';
import '/ui/widgets/interested_item.dart';

import '/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class DetailPage extends StatefulWidget {
  
  final DestinationModel destination;

  const DetailPage(this.destination, { Key? key }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [backgroundImage(), customShadow(), content()],
        ),
      ),
    );
  }

  Widget backgroundImage() {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(widget.destination.imageUrl))),
    );
  }

  Widget customShadow() {
    return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              kWhiteColor.withOpacity(0),
              kBlackColor.withOpacity(0.95)
            ])));
  }

  Widget content() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        children: [
          Container(
              width: 100,
              height: 24,
              margin: EdgeInsets.only(
                  top: 30, left: defaultMargin, right: defaultMargin),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/map.png')))),
          Container(
            //Title
            margin: EdgeInsets.only(top: 256),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.destination.name,
                        style: whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      Text(
                        widget.destination.city,
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: light),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                     widget.destination.rating.toString(),
                      style: whiteTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            //About
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: blackTextStyle.copyWith(height: 2),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Photos',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    PhotoItem(
                      imageUrl: 'assets/images/swiss_1.jpg',
                    ),
                    PhotoItem(
                      imageUrl: 'assets/images/swiss_2.jpg',
                    ),
                    PhotoItem(
                      imageUrl: 'assets/images/swiss_3.jpg',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Interests',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    InterestItem(title: 'Kids Park'),
                    InterestItem(title: 'Honor Bridge'),
                  ],
                ),
                Row(
                  children: [
                    InterestItem(title: 'City Meuseum'),
                    InterestItem(title: 'Central Mall'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            //Price
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0 ).format(widget.destination.price),
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Per Orang',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  ),
                ),
                CustomButton(
                  title: 'Book Now',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseSeatPage(widget.destination)));
                  },
                  width: 170,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
