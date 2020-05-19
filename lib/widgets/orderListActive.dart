import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/models/order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class OrderListActive extends StatefulWidget {

  List<Order> orderList;

  OrderListActive(this.orderList);

  @override
  _OrderListActiveState createState() => _OrderListActiveState();
}

class _OrderListActiveState extends State<OrderListActive> {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;

    Widget _getCard(Order order) {

      Color color;
      IconData icon;

      if(order.status == 'pending'){
        icon = Icons.access_time;
        color = Colors.grey;
      }else if(order.status == 'confirm'){
        color = Colors.amber;
        icon = Icons.done;
      }else{
        color = Colors.green;
        icon = Icons.done_all;
      }
      
      String _getStatus(String status){
        if(status == 'ready'){
          return 'Status : Ready for pickup';
        }else if(status == 'pending'){
          return 'Status : Waiting for confirmation';
        }else{
          return 'Status : Order Confirmed';
        }
      }

      return Container(
        height: _mediaQuery.height * 0.15,
        margin: EdgeInsets.only(left: _mediaQuery.width * 0.07,right: _mediaQuery.width * 0.07, bottom: _mediaQuery.height*0.02),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: color, blurRadius: 1, spreadRadius: 0.5)
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
                    color: color,
                    margin: EdgeInsets.only(right: _mediaQuery.width * 0.04),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: _mediaQuery.height * 0.035,
                        child: AutoSizeText(
                          order.oid,
                          maxLines: 1,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: _mediaQuery.height * 0.025,
                        child: AutoSizeText(
                          _getStatus(order.status),
                          maxLines: 1,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: order.status == 'ready' ?Colors.green : Colors.black54),
                        ),
                      ),
                      (order.status == 'pending'|| order.status == 'ready')?Container():Container(
                        height: _mediaQuery.height * 0.025,
                        child: AutoSizeText(
                          "Pick Up Time : ${Jiffy(order.userPickupTime).jm}",
                          maxLines: 1,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: _mediaQuery.height * 0.2,
                        width: _mediaQuery.width * 0.1,
                        color: color,
                        child: Icon(
                          icon,
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
            "Active Orders",
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
        }, itemCount: widget.orderList.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),)
      ],
    );
  }
}
