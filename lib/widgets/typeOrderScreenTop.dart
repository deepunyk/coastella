import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/screens/textOrderScreen.dart';
import 'package:coastella/screens/uploadPhotoScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeOrderScreenTop extends StatefulWidget {
  @override
  _TypeOrderScreenTopState createState() => _TypeOrderScreenTopState();
}

class _TypeOrderScreenTopState extends State<TypeOrderScreenTop> {
  @override
  Widget build(BuildContext context) {
    Color _color = Theme
        .of(context)
        .primaryColor;
    final _mediaQuery = MediaQuery
        .of(context)
        .size;

    return Column(
      children: <Widget>[
        SizedBox(
          height: _mediaQuery.height * 0.01,
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/selectType.png",
            height: _mediaQuery.height * 0.3,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: _mediaQuery.height * 0.01,
        ),
        Container(
          height: _mediaQuery.height * 0.035,
          padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width * 0.1),
          width: double.infinity,
          alignment: Alignment.center,
          child: AutoSizeText(
            "Select how you want to place the order",
            style: GoogleFonts.nunitoSans(fontSize: 40),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: _mediaQuery.height * 0.015,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _mediaQuery.width * 0.4,
              height: _mediaQuery.height * 0.18,
              alignment: Alignment.center,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(15),
                border: Border.all(color: _color, width: 1),),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(TextOrderScreen.routeName);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.keyboard,
                          color: _color,
                          size: _mediaQuery.height * 0.06,
                        ),
                        Text(
                          "Enter order list",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(),
                        ),
                        SizedBox(
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: _mediaQuery.width * 0.05,
            ),
            Container(
              width: _mediaQuery.width * 0.4,
              height: _mediaQuery.height * 0.18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: _color, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(UploadPhotoScreen.routeName);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.photo_camera,
                          color: _color,
                          size: _mediaQuery.height * 0.06,
                        ),
                        Text(
                          "Upload a photo of list",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(),
                        ),
                        SizedBox(
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
