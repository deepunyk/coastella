import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/models/shop.dart';
import 'package:coastella/providers/shops.dart';
import 'package:coastella/screens/shopDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class SearchScreen extends StatefulWidget {

  static const routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  
  Shops shops;
  List<Shop> filterList = [];
  List<Shop> mainList;

  filter(String value){
    filterList.clear();
    setState(() {
      mainList.map((val){
        if(val.name.toString().toLowerCase().contains(value.toLowerCase())){
          filterList.add(val);
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    shops = Provider.of<Shops>(context);
    mainList = shops.shops;
    
    final _mediaQuery = MediaQuery.of(context).size;

    Widget createTile(Shop shop) {
      return Container(
        margin: EdgeInsets.only(left: _mediaQuery.width*0.06,right: _mediaQuery.width*0.06,bottom: _mediaQuery.height*0.02),
        padding: EdgeInsets.symmetric(vertical: _mediaQuery.height*0.02, horizontal: _mediaQuery.width*0.02),
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5),),
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(ShopDetailsScreen.routeName);
          },
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
      );
    }

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
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
                  width: double.infinity,
                ),
                Container(
                  height: _mediaQuery.height * 0.035,
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Enter shop name",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 40, fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
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
                          color: Color(0xfff5e5e5),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: _mediaQuery.width * 0.05),
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
                                autofocus: true,
                                onChanged: (val){
                                  filter(val);
                                },
                                decoration:
                                InputDecoration.collapsed(hintText: "Search",),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (BuildContext ctx, index) {
              return createTile(filterList.length == 0 ? mainList[index] : filterList[index]);
            },
            itemCount: filterList.length == 0? mainList.length : filterList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),),
          )
        ],
      ),
    );
  }
}
