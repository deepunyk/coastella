import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/screens/enterNameScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpAuthScreen extends StatefulWidget {

  static const routeName = '/otpAuth';

  @override
  _OtpAuthScreenState createState() => _OtpAuthScreenState();
}

class _OtpAuthScreenState extends State<OtpAuthScreen> {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfffff3f3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: _mediaQuery.height * 0.2,
            ),
            Hero(
              tag: 'phoneHero',
              child: Image.asset(
                "assets/images/phoneNumber.png",
                height: _mediaQuery.height * 0.25,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: double.infinity,
              height: _mediaQuery.height * 0.06,
            ),
            Column(
              children: <Widget>[
                Container(
                  width: _mediaQuery.width * 0.6,
                  child: AutoSizeText(
                    "OTP Verification",
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w700, fontSize: 40),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: _mediaQuery.width * 0.6,
                  height: _mediaQuery.height * 0.05,
                  child: AutoSizeText(
                    "We have sent the OTP to your mobile number",
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
              height: _mediaQuery.height * 0.03,
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
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration.collapsed(hintText: "Enter OTP"),
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
                        Navigator.of(context).pushNamed(EnterNameScreen.routeName);
                      },
                      child: Text(
                        "Verify",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        width: _mediaQuery.width * 0.2,
                        height: _mediaQuery.height * 0.03,
                        child: Material(
                          color:  Colors.transparent,
                          child: InkWell(
                            onTap: (){},
                              child: Container(
                                  margin: EdgeInsets.only(
                                      right: _mediaQuery.width * 0.03),
                                  child: AutoSizeText(
                                    "Resend",
                                    style: GoogleFonts.nunitoSans(
                                        color: Theme.of(context).primaryColor),
                                    maxLines: 1,
                                    textAlign: TextAlign.end,
                                  ))),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
