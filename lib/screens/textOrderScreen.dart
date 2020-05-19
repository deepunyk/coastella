import 'package:coastella/widgets/textOrderMiddle.dart';
import 'package:coastella/widgets/textOrderTop.dart';
import 'package:coastella/widgets/uploadPhotoBottom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextOrderScreen extends StatefulWidget {

  static const routeName = 'textOrder';

  @override
  _TextOrderScreenState createState() => _TextOrderScreenState();
}

class _TextOrderScreenState extends State<TextOrderScreen> {

  @override
  Widget build(BuildContext context) {

    Color _color = Theme.of(context).primaryColor;
    final _mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfffff3f3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: _color,
          ),
        ),
        title: Text(
          "Place Order",
          style: GoogleFonts.nunitoSans(color: _color),
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: _mediaQuery.height * 0.02,
            ),
            TextOrderTop(),
            Container(
              margin: EdgeInsets.only(top: _mediaQuery.height * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: _mediaQuery.height * 0.03,
                  horizontal: _mediaQuery.width * 0.07),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  TextOrderMiddle(),
                  SizedBox(
                    height: _mediaQuery.height * 0.03,
                  ),
                  Container(
                    height: _mediaQuery.height * 0.06,
                    width: _mediaQuery.width * 0.85,
                    child: RaisedButton(
                      child: Text(
                        "Place Order",
                        style: GoogleFonts.nunitoSans(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      color: Theme.of(context).primaryColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360)),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height * 0.03,
                  ),
                  Divider(
                    color: _color,
                  ),
                  SizedBox(
                    height: _mediaQuery.height * 0.03,
                  ),
                  UploadPhotoBottom()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
