import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    final _mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/medLogo.png", height: _mediaQuery.height*0.15, fit: BoxFit.contain,),
            SizedBox(height: _mediaQuery.height*0.005,),
            Container(
              height: _mediaQuery.height*0.045,
              width: _mediaQuery.width*0.5,
              alignment: Alignment.center,
              child: AutoSizeText(
                "Coastella",
                style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600, fontSize: 40),maxLines: 1,textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
