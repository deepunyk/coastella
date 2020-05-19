import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeOrderScreenBottom extends StatefulWidget {
  @override
  _TypeOrderScreenBottomState createState() => _TypeOrderScreenBottomState();
}

class _TypeOrderScreenBottomState extends State<TypeOrderScreenBottom> {
  @override
  Widget build(BuildContext context) {
    Color _color = Theme.of(context).primaryColor;
    final _mediaQuery = MediaQuery.of(context).size;

    var photoOrder = RichText(
      text: TextSpan(
          style: GoogleFonts.nunitoSans(),
          children: <TextSpan>[
            TextSpan(
              text: "• ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text: "Take a photo of your hand written List\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
            TextSpan(
              text: "• ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text:"Enter the pick up time\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
            TextSpan(
              text: "• ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text: "Send your list to the Retailer\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
            TextSpan(
              text: "• ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text: "Wait for Confirmation\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
            TextSpan(
              text: "• ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text: "Holaaa, you are ready to pick up your order at the specified time",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
          ]
      ),
    );

    var textOrder = RichText(
      text: TextSpan(
          style: GoogleFonts.nunitoSans(),
          children: <TextSpan>[
            TextSpan(
              text: "• ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text: "Type your order List\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
            TextSpan(
              text: "• ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text: "Enter the pick up time\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
            TextSpan(
              text: "• ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text: "Send your list to the Retailer\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
            TextSpan(
              text: "• ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text: "Wait for Confirmation\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
            TextSpan(
              text: "• ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text: "Holaaa, you are ready to pick up your order at the specified time",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
          ]
      ),
    );

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: _mediaQuery.height * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: Card(
          shadowColor: _color,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _mediaQuery.width * 0.1,
                vertical: _mediaQuery.height * 0.02),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.live_help,
                      color: _color,
                      size: _mediaQuery.height * 0.035,
                    ),
                    Container(
                      height: _mediaQuery.height * 0.035,
                      child: AutoSizeText(
                        "Guide",
                        style: GoogleFonts.nunitoSans(
                            color: _color,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _mediaQuery.height * 0.01,
                ),
                Divider(
                  color: _color,
                ),
                SizedBox(
                  height: _mediaQuery.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Enter Order List",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child:textOrder,
                ),
                SizedBox(
                  height: _mediaQuery.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Upload Photo of List",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: photoOrder,
                ),
                SizedBox(
                  height: _mediaQuery.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
