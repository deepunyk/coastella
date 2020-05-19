import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/screens/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopListTop extends StatefulWidget {

  String userName;
  Function setLocation;
  String location;

  ShopListTop(this.userName, this.setLocation, this.location);
  @override
  _ShopListTopState createState() => _ShopListTopState();
}

class _ShopListTopState extends State<ShopListTop> {

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
          bottom: _mediaQuery.height * 0.05,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: _mediaQuery.height * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: _mediaQuery.height * 0.025,
                    width: _mediaQuery.width * 0.4,
                    child: AutoSizeText(
                      "Location",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 40, fontWeight: FontWeight.w400),
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    height: _mediaQuery.height * 0.04,
                    width: _mediaQuery.width * 0.4,
                    child: AutoSizeText(
                      widget.location == 'udupi' ? 'Udupi' : "Manipal",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 40, fontWeight: FontWeight.w600),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: _mediaQuery.height * 0.0625,
                    width: _mediaQuery.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: _mediaQuery.height * 0.02,
                          width: _mediaQuery.width * 0.3,
                          alignment: Alignment.bottomRight,
                          child: AutoSizeText(
                            "Change to",
                            textAlign: TextAlign.right,
                            style: GoogleFonts.nunitoSans(
                                fontSize: 40, fontWeight: FontWeight.w500),
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          height: _mediaQuery.height * 0.03,
                          width: _mediaQuery.width * 0.2,
                          alignment: Alignment.topRight,
                          child: AutoSizeText(
                            widget.location == 'udupi' ? 'Manipal' : "Udupi",
                            textAlign: TextAlign.right,
                            style: GoogleFonts.nunitoSans(
                                fontSize: 40, fontWeight: FontWeight.w600,),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: _mediaQuery.width * 0.02,
                  ),
                  Container(
                    height: _mediaQuery.height * 0.0625,
                    width: _mediaQuery.height * 0.0625,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Material(
                          color: Color(0xfff7f5f5),
                          child: InkWell(
                            onTap: (){
                              widget.setLocation(widget.location == 'udupi' ? 'manipal' : "udupi");
                            },
                            child: Icon(
                              Icons.swap_horiz,
                              size: _mediaQuery.height * 0.05,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: _mediaQuery.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: _mediaQuery.width * 0.86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)),
                child: Material(
                  color: Color(0xfff5e5e5),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(SearchScreen.routeName);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width * 0.05),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            size: _mediaQuery.height * 0.035,
                          ),
                          SizedBox(
                            width: _mediaQuery.width * 0.02,
                          ),
                          Expanded(
                            child: TextField(
                              enabled: false,
                              decoration:
                                  InputDecoration.collapsed(hintText: "Search"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
