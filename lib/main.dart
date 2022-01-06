import 'package:bwa_airplane/cubit/auth/auth_cubit.dart';
import 'package:bwa_airplane/cubit/transaction/transaction_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/pages/mainpage.dart';
import '/ui/pages/get_started.dart';
import 'cubit/destinations/destination_cubit.dart';
import 'cubit/page_cubit.dart';
import 'cubit/seat/seat_cubit.dart';
import 'ui/pages/sign_in_page.dart';
import 'ui/pages/sign_up_page.dart';
import 'ui/pages/splash_page.dart';
import 'ui/pages/success_checkout_page.dart';

Future<void> main() async {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit(),),
        BlocProvider(create: (context) => AuthCubit(),),
        BlocProvider(create: (context) => DestinationCubit(),),
        BlocProvider(create: (context) => SeatCubit(),),
        BlocProvider(create: (context) => TransactionCubit(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (ctx) => SplashPage(),
          '/get-started': (ctx) => GetStartedPage(),
          '/sign-up': (ctx) => SignUp(),
          '/sign-in': (ctx) => SignIn(),
          '/mainpage': (ctx) => MainPage(),
          '/success': (ctx) => SuccessCheckout()
        },
      ),
    );
  }
}
