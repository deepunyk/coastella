import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountBottom extends StatefulWidget {
  @override
  _AccountBottomState createState() => _AccountBottomState();
}

class _AccountBottomState extends State<AccountBottom> {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    Color primaryColor = Theme.of(context).primaryColor;

    Widget _getCard(String title, IconData icon) {
      return Container(
        height: _mediaQuery.height * 0.085,
        width: _mediaQuery.width * 0.85,
        margin: EdgeInsets.only(bottom: _mediaQuery.height*0.03),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor, width: 1)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              splashColor: Color(0x59c62828),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _mediaQuery.width * 0.06,
                  vertical: _mediaQuery.height * 0.022,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon,
                      color: Color(0xf2c62828),
                      size: _mediaQuery.height * 0.04,
                    ),
                    SizedBox(
                      width: _mediaQuery.width * 0.04,
                    ),
                    AutoSizeText(
                      title,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        _getCard("Privacy Policy", Icons.security),
        _getCard("Terms and Conditions", Icons.account_balance),
        _getCard("Add Business", Icons.business_center),
        _getCard("Help", Icons.live_help),
      ],
    );
  }
}
