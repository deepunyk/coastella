import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/screens/phoneAuthScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectLanguageScreen extends StatefulWidget {
  @override
  _SelectLanguageScreenState createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            "assets/images/selectLanguage.png",
            height: _mediaQuery.height * 0.35,
            fit: BoxFit.contain,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: _mediaQuery.width * 0.65,
                child: AutoSizeText(
                  "Select Your Preffered Language",
                  style: GoogleFonts.nunitoSans(fontSize: 50),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: _mediaQuery.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      Navigator.of(context).pushNamed(PhoneAuthScreen.routeName);
                    },
                    color: Color(0xffede9e9),
                    child: Text(
                      "English",
                      style: GoogleFonts.nunitoSans(
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(
                    width: _mediaQuery.width * 0.1,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                    color: Color(0xffede9e9),
                    child: Text(
                      "Kannada",
                      style: GoogleFonts.nunitoSans(
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
