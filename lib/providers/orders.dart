import 'package:coastella/models/order.dart';
import 'package:flutter/material.dart';

class Orders with ChangeNotifier{
  List<Order> _orders = [];

  List<Order> get shops{
    return [..._orders];
  }

  void addOrder(Order order){
    _orders.add(order);
    notifyListeners();
  }

  List<Order> getActiveOrders(){
    return _orders.where((element){
      if(element.status != 'paid'){
        return true;
      }else{
        return false;
      }
    }).toList();
  }

  List<Order> getCompleteOrders(){
    return _orders.where((element){
      if(element.status == 'paid'){
        return true;
      }else{
        return false;
      }
    }).toList();
  }
}