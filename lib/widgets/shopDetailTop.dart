import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/models/shop.dart';
import 'package:coastella/widgets/shopDetailTop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopDetailTop extends StatefulWidget {

  final Shop shop;
  ShopDetailTop(this.shop);

  @override
  _ShopDetailTopState createState() => _ShopDetailTopState();
}

class _ShopDetailTopState extends State<ShopDetailTop> {

  String _getType(String type){
    if(type == 'Grocery'){
      return 'Grocery';
    }else if(type == 'Medical'){
      return 'Pharmacy';
    }else{
      return 'Poultry';
    }
  }

  @override
  Widget build(BuildContext context) {

    final _mediaQuery = MediaQuery.of(context).size;
    final _color = Theme.of(context).primaryColor;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width*0.05, vertical: _mediaQuery.height*0.03),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      "Address",
                      style: GoogleFonts.nunitoSans(color: _color, fontSize: 18),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      widget.shop.address,
                      style: GoogleFonts.nunitoSans(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    color: _color,
                    child: InkWell(
                      onTap: (){
                        launch("tel://${widget.shop.phone}");
                      },
                      child: Padding(
                        padding: EdgeInsets.all(_mediaQuery.width*0.015),
                        child: Icon(Icons.call, color: Colors.white,size: _mediaQuery.width*0.07,),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: _mediaQuery.height*0.015,
          ),
          Divider(color: _color,),
          SizedBox(
            height: _mediaQuery.height*0.015,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  AutoSizeText(
                    "Type",
                    style: GoogleFonts.nunitoSans(color: _color, fontSize: 16),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    _getType(widget.shop.type),
                    style: GoogleFonts.nunitoSans(fontSize: 14),
                    maxLines: 1,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  AutoSizeText(
                    "Ratings",
                    style: GoogleFonts.nunitoSans(color: _color, fontSize: 16),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText(
                        widget.shop.rating,
                        style: GoogleFonts.nunitoSans(fontSize: 14),
                        maxLines: 1,
                      ),
                      Icon(Icons.star, color: Colors.amber,size: _mediaQuery.height*0.025,)
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: _mediaQuery.height*0.015,
          ),
          SizedBox(
            height: _mediaQuery.height*0.015,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  AutoSizeText(
                    "Home Delivery",
                    style: GoogleFonts.nunitoSans( fontSize: 16),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    widget.shop.isDelivery=='0'? 'No' : 'Yes',
                    style: GoogleFonts.nunitoSans(fontSize: 14,color: widget.shop.isDelivery=='0'? _color : Colors.green),
                    maxLines: 1,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  AutoSizeText(
                    "Carry Bag",
                    style: GoogleFonts.nunitoSans( fontSize: 16),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText(
                        widget.shop.isCarryBag=='0'? 'No' : 'Yes',
                        style: GoogleFonts.nunitoSans(fontSize: 14,color: widget.shop.isCarryBag=='0'? _color : Colors.green),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  AutoSizeText(
                    "Carton Box",
                    style: GoogleFonts.nunitoSans(fontSize: 16),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText(
                        widget.shop.isCartonBox=='0'? 'No' : 'Yes',
                        style: GoogleFonts.nunitoSans(fontSize: 14, color: widget.shop.isCartonBox=='0'? _color : Colors.green),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
