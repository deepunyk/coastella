import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/providers/orders.dart';
import 'package:coastella/widgets/orderListActive.dart';
import 'package:coastella/widgets/orderListComplete.dart';
import 'package:coastella/widgets/orderListTop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderListMainScreen extends StatefulWidget {
  @override
  _OrderListMainScreenState createState() => _OrderListMainScreenState();
}

class _OrderListMainScreenState extends State<OrderListMainScreen> {

  Orders orders;

  @override
  Widget build(BuildContext context) {

    orders = Provider.of<Orders>(context);

    final _mediaQuery = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: <Widget>[
        OrderListTop(),
        SizedBox(height: 5,),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                OrderListActive(orders.getActiveOrders()),
                OrderListComplete(orders.getCompleteOrders()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

