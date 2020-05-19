import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/models/shop.dart';
import 'package:coastella/providers/shops.dart';
import 'package:coastella/widgets/shopListScreenBottom.dart';
import 'package:coastella/widgets/shopListScreenMiddle.dart';
import 'package:coastella/widgets/shopListScreenTop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopListMainScreen extends StatefulWidget {
  @override
  _ShopListMainScreenState createState() => _ShopListMainScreenState();
}

class _ShopListMainScreenState extends State<ShopListMainScreen> {

  Shops shops;
  String type = "Grocery";
  String shopType = "Grocery Store";
  String userName;
  String location = 'udupi';

  _getStoredData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  void setLocation(String loc){
    setState(() {
      location = loc;
    });
  }

  void setType(String tp, String shopTp){
    setState(() {
      type = tp;
      shopType = shopTp;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStoredData();
  }
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    shops = Provider.of<Shops>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ShopListTop(userName,setLocation, location),
          SizedBox(
            height: _mediaQuery.height * 0.05,
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width * 0.07),
            height: _mediaQuery.height * 0.04,
            width: _mediaQuery.width * 0.6,
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              "Categories",
              textAlign: TextAlign.start,
              maxLines: 1,
              style: GoogleFonts.nunitoSans(
                  fontSize: 40, fontWeight: FontWeight.w700),
            ),
          ),
          ShopListMiddle(setType, type),
          SizedBox(
            height: _mediaQuery.height * 0.02,
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width * 0.07),
            height: _mediaQuery.height * 0.04,
            width: _mediaQuery.width * 0.6,
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              shopType,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: GoogleFonts.nunitoSans(
                  fontSize: 40, fontWeight: FontWeight.w700),
            ),
          ),
          ShopListBottom(shops.getShops(location, type))
        ],
      ),
    );
  }
}
