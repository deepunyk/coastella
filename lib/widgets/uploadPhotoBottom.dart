import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadPhotoBottom extends StatefulWidget {
  @override
  _UploadPhotoBottomState createState() => _UploadPhotoBottomState();
}

class _UploadPhotoBottomState extends State<UploadPhotoBottom> {
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
              text: "Write the order list in Kannada or English\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 15,
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
              text:"Ensure the List format is as shown below\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
            TextSpan(
              text: "",
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _color),
            ),
            TextSpan(
              text: "    Item Name, Brand (if any), Quantity\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 15,
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
              text: "Upload the Photo of your list, ensure this photo is clear\n",
              style: GoogleFonts.nunitoSans(
                fontSize: 15,
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
              text: "The pickup time can be changed by the retailer when he accepts the order",
              style: GoogleFonts.nunitoSans(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,),
            ),
          ]
      ),
    );

    return Column(
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
          height: _mediaQuery.height*0.02,
        ),
        photoOrder,
      ],
    );
  }
}
