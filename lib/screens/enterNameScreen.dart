import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterNameScreen extends StatefulWidget {

  static const routeName = '/enterName';

  @override
  _EnterNameScreenState createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {

  @override
  Widget build(BuildContext context) {

    final _mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfffff3f3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: _mediaQuery.width*0.6,
                child: AutoSizeText(
                  "What do we call you?",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w700, fontSize: 40),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: _mediaQuery.width*0.5,
                height: _mediaQuery.height*0.05,
                child: AutoSizeText(
                  "Please enter your full name",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w400, fontSize: 40),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: _mediaQuery.height*0.03,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: _mediaQuery.height * 0.05,
                horizontal: _mediaQuery.width * 0.1),
            width: _mediaQuery.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: Color(0xfff7f5f5),
                        borderRadius: BorderRadius.circular(8)),
                    width: _mediaQuery.width * 0.65,
                    padding: EdgeInsets.symmetric(
                        horizontal: _mediaQuery.width * 0.05),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration.collapsed(
                          hintText: "Enter your name"),
                    )),
                SizedBox(
                  height: _mediaQuery.height * 0.035,
                ),
                Container(
                  width: _mediaQuery.width * 0.65,
                  height: _mediaQuery.height * 0.06,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(360)),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    },
                    child: Text(
                      "LETS GO!",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
