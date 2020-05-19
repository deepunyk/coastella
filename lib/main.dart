import 'package:coastella/providers/orders.dart';
import 'package:coastella/providers/shops.dart';
import 'package:coastella/screens/editAccountInfo.dart';
import 'package:coastella/screens/enterNameScreen.dart';
import 'package:coastella/screens/homeScreen.dart';
import 'package:coastella/screens/otpAuthScreen.dart';
import 'package:coastella/screens/phoneAuthScreen.dart';
import 'package:coastella/screens/searchScreen.dart';
import 'package:coastella/screens/selectAddressScreen.dart';
import 'package:coastella/screens/selectLanguageScreen.dart';
import 'package:coastella/screens/shopDetailsScreen.dart';
import 'package:coastella/screens/shopListMainScreen.dart';
import 'package:coastella/screens/splashScreen.dart';
import 'package:coastella/screens/textOrderScreen.dart';
import 'package:coastella/screens/typeOrderScreen.dart';
import 'package:coastella/screens/uploadPhotoScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx)=>Shops(),
        ),
        ChangeNotifierProvider(
          create: (ctx)=>Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coastella',
        theme: ThemeData(
          primaryColor: Color(0xffc62828),
        ),
          home: PhoneAuthScreen(),
        routes: {
          PhoneAuthScreen.routeName :(ctx) =>PhoneAuthScreen(),
          OtpAuthScreen.routeName :(ctx) =>OtpAuthScreen(),
          EnterNameScreen.routeName :(ctx) =>EnterNameScreen(),
          HomeScreen.routeName :(ctx) =>HomeScreen(),
          SearchScreen.routeName :(ctx) =>SearchScreen(),
          ShopDetailsScreen.routeName :(ctx) =>ShopDetailsScreen(),
          TypeOrderScreen.routeName :(ctx) =>TypeOrderScreen(),
          UploadPhotoScreen.routeName :(ctx) =>UploadPhotoScreen(),
          TextOrderScreen.routeName :(ctx) =>TextOrderScreen(),
          EditAccountInfo.routeName :(ctx) =>EditAccountInfo(),
          SelectAddressScreen.routeName :(ctx) =>SelectAddressScreen(),
        },
      ),
    );
  }
}