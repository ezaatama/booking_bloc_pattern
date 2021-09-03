import 'package:bwa_airplane/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class DestinationsCard extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final String title;
  final String city;

  const DestinationsCard(
      {Key? key,
      required this.imageUrl,
      this.rating = 0.0,
      required this.title,
      required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailPage()));
      },
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Container(
              width: 200,
              height: 323,
              margin: EdgeInsets.only(left: defaultMargin),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: kWhiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 180,
                    height: 220,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 55,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(18)),
                            color: kWhiteColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: EdgeInsets.only(right: 2),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/icons/star.png'))),
                            ),
                            Text(
                              rating.toString(),
                              style: blackTextStyle.copyWith(fontWeight: medium),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          city,
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
