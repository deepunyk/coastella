import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/models/shop.dart';
import 'package:coastella/screens/typeOrderScreen.dart';
import 'package:coastella/widgets/shopDetailMap.dart';
import 'package:coastella/widgets/shopDetailTop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopDetailsScreen extends StatefulWidget {
  static const routeName = 'shopDetails';

  @override
  _ShopDetailsScreenState createState() => _ShopDetailsScreenState();
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Color _color = Theme.of(context).primaryColor;
    final _mediaQuery = MediaQuery.of(context).size;
    Shop shop = ModalRoute.of(context).settings.arguments as Shop;

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
          shop.name,
          style: GoogleFonts.nunitoSans(color: _color),
        ),
        elevation: 5,
      ),
      body: Column(
        children: <Widget>[
          ShopDetailMap(shop),
          ShopDetailTop(shop),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: _mediaQuery.height*0.06,
                width: _mediaQuery.width*0.85,
                  child: RaisedButton(
                child: Text("Place Order", style: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                color: Theme.of(context).primaryColor,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
                onPressed: () {
                  Navigator.of(context).pushNamed(TypeOrderScreen.routeName);
                },
              ),),
            ),
          )
        ],
      ),
    );
  }
}
