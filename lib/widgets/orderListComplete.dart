import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/models/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class OrderListComplete extends StatefulWidget {

  List<Order> orderList;

  OrderListComplete(this.orderList);

  @override
  _OrderListCompleteState createState() => _OrderListCompleteState();
}

class _OrderListCompleteState extends State<OrderListComplete> {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery
        .of(context)
        .size;
    final primaryColor = Theme
        .of(context)
        .primaryColor;

    Widget _getStars(int num) {
      int i = 0;
      Icon star = Icon(
        Icons.star, color: Colors.amber, size: _mediaQuery.height * 0.03,);
      List<Widget> stars = [star, star, star, star, star];
      return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: stars.map((e) {
            i++;
            if (i > num)
              return Icon(Icons.star_border, color: Colors.amber,
                size: _mediaQuery.height * 0.03,);
            return e;
          }).toList()
      );
    }

    Widget _putStars() {
      return Container(
        height: _mediaQuery.height * 0.025,
        child: AutoSizeText("Rate your order",
          style: GoogleFonts.nunitoSans(color: primaryColor, fontSize: 40),
          maxLines: 1,
          textAlign: TextAlign.left),
      );
    }

    Widget _getCard(Order order) {
      return Container(
        height: _mediaQuery.height * 0.15,
        margin: EdgeInsets.only(left: _mediaQuery.width * 0.07,right: _mediaQuery.width * 0.07, bottom: _mediaQuery.height*0.02),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: primaryColor, blurRadius: 1, spreadRadius: 0.5)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: _mediaQuery.width * 0.02,
                    color: primaryColor,
                    margin: EdgeInsets.only(right: _mediaQuery.width * 0.04),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: _mediaQuery.height * 0.035,
                        child: AutoSizeText(
                          order.sid,
                          maxLines: 1,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: _mediaQuery.height * 0.025,
                        child: AutoSizeText(
                          Jiffy(order.paidTime).yMMMMEEEEd.toString(),
                          maxLines: 1,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ),
                      int.parse(order.rating) == 0 ? _putStars() : _getStars(int.parse(order.rating)),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: _mediaQuery.height * 0.2,
                        width: _mediaQuery.width * 0.1,
                        color: primaryColor,
                        child: Icon(
                          Icons.done_all,
                          color: Colors.white,
                          size: _mediaQuery.width * 0.06,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: _mediaQuery.height * 0.05),
          padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width * 0.07),
          width: double.infinity,
          height: _mediaQuery.height * 0.04,
          alignment: Alignment.bottomLeft,
          child: AutoSizeText(
            "Completed Orders",
            textAlign: TextAlign.start,
            maxLines: 1,
            style: GoogleFonts.nunitoSans(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListView.builder(itemBuilder: (BuildContext context, index){
          return _getCard(widget.orderList[index]);
        }, itemCount: widget.orderList.length,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,)
      ],
    );
  }
}
