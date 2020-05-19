import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopListMiddle extends StatefulWidget {

  String type;
  Function setType;

  ShopListMiddle(this.setType,this.type);

  @override
  _ShopListMiddleState createState() => _ShopListMiddleState();
}

class _ShopListMiddleState extends State<ShopListMiddle> {
  List<int> cardCodes = [1,0,0];
  String shopType = "Grocery Shop";

  @override
  Widget build(BuildContext context) {

    final _mediaQuery = MediaQuery.of(context).size;

    void tapCard(int selectedIndex){
      setState(() {
        cardCodes[0] = 0;
        cardCodes[1] = 0;
        cardCodes[2] = 0;
        cardCodes[selectedIndex] = 1;
        switch(selectedIndex){
          case 0:
            shopType = "Grocery Shop";
            widget.setType('Grocery', 'Grocery Store');
            return;
          case 1:
            shopType = "Pharmacy";
            widget.setType('Medical','Pharmacy');
            return;
          case 2:
            shopType = "Poultry";
            widget.setType('Poultry','Poultry');
            return;
        }
      });
    }

    Widget getCard(int code, String title, String img){
      return Container(
        margin: EdgeInsets.only(left: _mediaQuery.width*0.05, top: _mediaQuery.height*0.02, bottom: _mediaQuery.height*0.02),
        width: _mediaQuery.width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Color(0xfff9d8d8),spreadRadius: 3, blurRadius: 5)]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Material(
            color: cardCodes[code] == 1 ? Theme.of(context).primaryColor:Colors.white,
            child: InkWell(
              onTap: (){
                tapCard(code);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Container(
                      height: _mediaQuery.height*0.08,
                      width: _mediaQuery.height*0.08,
                      padding: EdgeInsets.all(_mediaQuery.height*0.015),
                      color: Colors.white,
                      child: Image.asset(
                        img,
                        height: _mediaQuery.height * 0.05,
                      ),
                    ),
                  ),
                  Container(
                    height: _mediaQuery.height * 0.03,
                    width: _mediaQuery.width * 0.3,
                    child: AutoSizeText(
                      title,
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w600, fontSize: 40,color: cardCodes[code] == 1 ? Colors.white:Colors.black),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      height: _mediaQuery.height*0.25,
      width: double.infinity,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          getCard(0, "Grocery", "assets/images/groceryIcon.png"),
          getCard(1, "Medical", "assets/images/medicalIcon.png"),
          getCard(2, "Poultry", "assets/images/chickenIcon.png"),
        ],
      ),
    );
  }
}
