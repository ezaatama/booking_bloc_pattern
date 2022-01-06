import 'package:bwa_airplane/cubit/auth/auth_cubit.dart';
import 'package:bwa_airplane/cubit/destinations/destination_cubit.dart';
import 'package:bwa_airplane/models/destinations_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/widgets/destination_tile.dart';

import '/ui/widgets/destinations_card.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: kRedColor, content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestionations(state.destinations),
              newDestinations(state.destinations )
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
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

  Widget popularDestionations(List<DestinationModel> destinations) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: destinations.map((DestinationModel destination) {
          return DestinationsCard(destination);
        }).toList()),
      ),
    );
  }

  Widget newDestinations(List<DestinationModel> destinations) {
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
          Column(
            children:
                destinations.map((DestinationModel destination) {
                  return DestinationTile(destination);
                }).toList(),
          )
        ],
      ),
    );
  }
}
