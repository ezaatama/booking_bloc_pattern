import 'package:bwa_airplane/cubit/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/widgets/destination_tile.dart';

import '/ui/widgets/destinations_card.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [header(), popularDestionations(), newDestinations()],
    );
  }

  Widget header() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(
                left: defaultMargin, right: defaultMargin, top: 30),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo,\n${state.user.name}',
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                        // overflow: TextOverflow.ellipsis, > Digunakan untuk memotong teks yang terlalu panjang dalam satu baris
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Where you go today?',
                        style: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: light),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/zatama.png')),
                  ),
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget popularDestionations() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            DestinationsCard(
              imageUrl: 'assets/images/swiss_1.jpg',
              rating: 4.7,
              title: 'Jungfrau',
              city: 'Bern and Valais',
            ),
            DestinationsCard(
              imageUrl: 'assets/images/swiss_2.jpg',
              rating: 4.8,
              title: 'Mount Pilatus',
              city: 'Lucerne',
            ),
            DestinationsCard(
              imageUrl: 'assets/images/swiss_3.jpg',
              rating: 4.6,
              title: 'Kleine Scheidegg',
              city: 'Lauberhorn',
            ),
            DestinationsCard(
              imageUrl: 'assets/images/swiss_4.jpg',
              rating: 4.7,
              title: 'Titlis',
              city: 'Titlis',
            ),
          ],
        ),
      ),
    );
  }

  Widget newDestinations() {
    return Container(
      margin: EdgeInsets.only(
          top: 30, left: defaultMargin, right: defaultMargin, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New This Year',
            style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
          ),
          DestinationTile(
              imageUrl: 'assets/images/swiss_5.jpg',
              title: 'Piz Gloria',
              city: 'Schiltron',
              rating: 4.8),
          DestinationTile(
              imageUrl: 'assets/images/swiss_6.jpg',
              title: 'Kleine Scheidegg',
              city: 'Lauberhorn',
              rating: 4.8),
          DestinationTile(
              imageUrl: 'assets/images/swiss_7.jpg',
              title: 'Oeschinen Lake',
              city: 'Bernese Oberland',
              rating: 4.8),
          DestinationTile(
              imageUrl: 'assets/images/swiss_8.jpg',
              title: 'Staubbach Falls',
              city: 'Lauterbrunnen',
              rating: 4.8),
        ],
      ),
    );
  }
}
