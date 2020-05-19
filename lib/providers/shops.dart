import 'package:coastella/models/shop.dart';
import 'package:flutter/material.dart';

class Shops with ChangeNotifier{
  List<Shop> _shops = [];

  List<Shop> get shops{
    return [..._shops];
  }

  void addShop(Shop shop){
    _shops.add(shop);
    notifyListeners();
  }

  List<Shop> getShops(String location, String type){
    return shops.where((element){
      if(element.location == location && element.type == type){
        return true;
      }else{
        return false;
      }
    }).toList();
  }
}