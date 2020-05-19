import 'package:coastella/models/shop.dart';
import 'package:coastella/screens/shopDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopListBottom extends StatefulWidget {

  List<Shop> shopList;

  ShopListBottom(this.shopList);

  @override
  _ShopListBottomState createState() => _ShopListBottomState();
}

class _ShopListBottomState extends State<ShopListBottom> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery
        .of(context)
        .size;

    Widget createTile(Shop shop) {
      return Container(
        margin: EdgeInsets.only(left: _mediaQuery.width*0.06,right: _mediaQuery.width*0.06,bottom: _mediaQuery.height*0.01),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(ShopDetailsScreen.routeName,arguments: shop);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: _mediaQuery.height*0.02, horizontal: _mediaQuery.width*0.02),
                child: ListTile(
                  title: Text(shop.name, style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600),),
                  subtitle: Text(shop.address),
                  leading: CircleAvatar(backgroundColor: Theme.of(context).primaryColor,child: Icon(Icons.shopping_cart, color: Colors.white,)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.star,color: Colors.yellow,),
                      Text(shop.rating)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      children: <Widget>[
        ...widget.shopList.map((e) {
          return createTile(e);
        }),
      ],
    );
  }
}
