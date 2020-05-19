import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderListTop extends StatefulWidget {
  @override
  _OrderListTopState createState() => _OrderListTopState();
}

class _OrderListTopState extends State<OrderListTop> {
  @override
  Widget build(BuildContext context) {

    final _mediaQuery = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: _mediaQuery.height * 0.04,
          bottom: _mediaQuery.height * 0.04,
          left: _mediaQuery.width * 0.07,
          right: _mediaQuery.width * 0.07),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0xfff08686), blurRadius: 5, spreadRadius: 2)
        ],
        color: Color(0xfff7f5f5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: _mediaQuery.height*0.05,
              child: AutoSizeText(
                "My Orders",
                textAlign: TextAlign.start,
                maxLines: 1,
                style: GoogleFonts.nunitoSans(
                    fontSize: 40, fontWeight: FontWeight.w700, color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
