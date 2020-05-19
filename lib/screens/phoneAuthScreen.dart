import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/models/order.dart';
import 'package:coastella/models/shop.dart';
import 'package:coastella/providers/orders.dart';
import 'package:coastella/providers/shops.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homeScreen.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const routeName = '/phoneAuth';

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {

  String _phoneNumber;
  int _phone;
  Shops shops;
  Orders orders;
  List<Shop> _shopList;

  void _checkUser(BuildContext ctx) async {
    /*if (_phoneNumber == null) {
      final snackBar =
          SnackBar(content: Text('Please enter your phone number'));
      Scaffold.of(ctx).showSnackBar(snackBar);
      return;
    } else if (_phoneNumber.length != 10) {
      final snackBar =
          SnackBar(content: Text('Please enter a valid phone number'));
      Scaffold.of(ctx).showSnackBar(snackBar);
      return;
    } else {
      final response = await http.post(
        'http://coastella.in/coastellausers/php/getAllData.php',
        body: {
          'phone': _phoneNumber,
        },
      );
      if(response.body.toString() == 'no'){
        print("New user");
      }else{
        addAllData(response);
      }
    }*/
    final response = await http.post(
      'http://coastella.in/coastellausers/php/getAllData.php',
      body: {
        'phone': ":",
      },
    );
    if(response.body.toString() == 'no'){
      print("New user");
    }else{
      addAllData(response);
    }
  }

  void addAllData(http.Response response)async{
    final userResponse = json.decode(response.body);
    final allData = userResponse['allOrders'];
    final userData = allData['userInfo'];
    final shopList = allData['shops'].cast<Map<String,dynamic>>();
    final orderList = allData['orders'].cast<Map<String,dynamic>>();
    _addUserData(userData,shopList, orderList);
  }

  _addUserData(dynamic userData, List<Map<String, dynamic>> shopList, List<Map<String, dynamic>> orderList) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userData[0]['name']);
    await prefs.setString('userId', userData[0]['uid']);
    await prefs.setString('userPhone', userData[0]['phone']);
    await prefs.setString('userAddress', userData[0]['address']);
    await prefs.setString('userIsBanned', userData[0]['isBanned']);
    _addShopData(shopList, orderList);
  }

  _addShopData(List<Map<String, dynamic>> shopList, List<Map<String, dynamic>> orderList){
    shopList.map((val){
      return shops.addShop(Shop(
          sId: val['sid'] as String,
          address: val['address'] as String,
          isCarryBag: val['isCarryBag'] as String,
          isCartonBox: val['isCartonBox'] as String,
          isDelivery: val['isDelivery'] as String,
          lat: val['lat'] as String,
          long: val['lng'] as String,
          name: val['name'] as String,
          phone: val['phone'] as String,
          previousOrders: val['previousOrders'] as String,
          rating: val['rating'] as String,
          sImage: val['sImage'] as String,
          sLogo: val['sLogo'] as String,
          type: val['type'] as String,
          location: val['location'] as String
      ),);
    }).toList();
    _addOrderData(orderList);
  }

  _addOrderData(List<Map<String, dynamic>> orderList){
    orderList.map((val){
      return orders.addOrder(Order(
        isCartonBox: val['isCartonBox'] as String,
        isCarryBag: val['isCarryBag'] as String,
        oid: val['oid'] as String,
        orderList: val['orderList'] as String,
        orderType: val['orderType'] as String,
        paidTime: val['paidTime'] as String,
        placedTime: val['placedTime'] as String,
        shopComment: val['shopComment'] as String,
        sid: val['sid'] as String,
        status: val['status'] as String,
        totalCost: val['totalCost'] as String,
        uid: val['uid'] as String,
        userComment: val['userComment'] as String,
        userPickupTime: val['userPickupTime'] as String,
        rating: val['rating'] as String
      ),);
    }).toList();
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {

    shops = Provider.of<Shops>(context);
    orders = Provider.of<Orders>(context);
    final _mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfffff3f3),
      body: SingleChildScrollView(
        child: Builder(builder: (ctx) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: _mediaQuery.height * 0.2,
              ),
              Hero(
                tag: 'phoneHero',
                child: Image.asset(
                  "assets/images/phoneNumber.png",
                  height: _mediaQuery.height * 0.25,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                width: double.infinity,
                height: _mediaQuery.height * 0.06,
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: _mediaQuery.width * 0.6,
                    child: AutoSizeText(
                      "Verify Your Number",
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w700, fontSize: 40),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: _mediaQuery.width * 0.6,
                    height: _mediaQuery.height * 0.05,
                    child: AutoSizeText(
                      "Please enter your phone number to verify your account",
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w400, fontSize: 40),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: _mediaQuery.height * 0.03,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    vertical: _mediaQuery.height * 0.05,
                    horizontal: _mediaQuery.width * 0.1),
                width: _mediaQuery.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xfff7f5f5),
                          borderRadius: BorderRadius.circular(8)),
                      width: _mediaQuery.width * 0.65,
                      padding: EdgeInsets.symmetric(
                          horizontal: _mediaQuery.width * 0.05),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "+91",
                            style: GoogleFonts.nunitoSans(fontSize: 16),
                          ),
                          SizedBox(
                            width: _mediaQuery.width * 0.01,
                          ),
                          Flexible(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              style: GoogleFonts.nunitoSans(fontSize: 16),
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter your Phone number"),
                              onChanged: (val) {
                                _phoneNumber = val;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height * 0.035,
                    ),
                    Container(
                      width: _mediaQuery.width * 0.65,
                      height: _mediaQuery.height * 0.06,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(360)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          _checkUser(ctx);
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
