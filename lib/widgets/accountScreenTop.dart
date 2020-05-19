import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/screens/editAccountInfo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AccountTop extends StatefulWidget {
  @override
  _AccountTopState createState() => _AccountTopState();
}

class _AccountTopState extends State<AccountTop> {

  String name = "", phone= "", address= "";

  void _getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('userName');
    phone = prefs.getString('userPhone');
    address = prefs.getString('userAddress');
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {

    final _mediaQuery = MediaQuery.of(context).size;

    return Container(
      height: _mediaQuery.height * 0.4,
      width: _mediaQuery.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0x80c62828), spreadRadius: 2, blurRadius: 3)
        ],
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width * 0.1,
              vertical: _mediaQuery.height * 0.05),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  height: _mediaQuery.height * 0.04,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Material(
                      color: Color(0xffc62828),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(EditAccountInfo.routeName);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: _mediaQuery.height*0.005, horizontal: _mediaQuery.width*0.05),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              AutoSizeText("Edit", maxLines: 1,
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.white, fontSize: 40),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        size: _mediaQuery.height * 0.045,
                        color: Color(0xffc62828),
                      ),
                      SizedBox(width: _mediaQuery.width * 0.02,),
                      Container(
                        height: _mediaQuery.height * 0.045,
                        child: AutoSizeText(
                          "Account Info", maxLines: 1,
                          style: GoogleFonts.nunitoSans(
                              color: Color(0xffc62828),
                              fontSize: 40,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: _mediaQuery.height * 0.025,
                        child: AutoSizeText(
                          "Name", maxLines: 1,
                          style: GoogleFonts.nunitoSans(
                              color: Color(0xffc62828),
                              fontSize: 40,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: _mediaQuery.height * 0.035,
                        child: AutoSizeText(
                          name, maxLines: 1,
                          style: GoogleFonts.nunitoSans(color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: _mediaQuery.height * 0.025,
                        child: AutoSizeText(
                          "Phone Number", maxLines: 1,
                          style: GoogleFonts.nunitoSans(
                              color: Color(0xffc62828),
                              fontSize: 40,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: _mediaQuery.height * 0.028,
                        child: AutoSizeText(
                          phone, maxLines: 1,
                          style: GoogleFonts.nunitoSans(color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: _mediaQuery.height * 0.025,
                        child: AutoSizeText(
                          "Address", maxLines: 1,
                          style: GoogleFonts.nunitoSans(
                              color: Color(0xffc62828),
                              fontSize: 40,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: _mediaQuery.height * 0.028,
                        child: AutoSizeText(
                          address == "" ? "No Address" : address, maxLines: 1,
                          style: GoogleFonts.nunitoSans(color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
