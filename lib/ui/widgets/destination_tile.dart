import '/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class DestinationTile extends StatelessWidget {

  final String imageUrl;
  final double rating;
  final String title;
  final String city;

  const DestinationTile({Key? key, required this.imageUrl, this.rating = 0.0, required this.title, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailPage()));
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                  ),
                  SizedBox(height: 5),
                  Text(
                    city,
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
                  rating.toString(),
                  style: blackTextStyle.copyWith(fontWeight: medium),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
