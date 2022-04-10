
import 'package:flutter/foundation.dart';

class MyProviderBasketClient extends ChangeNotifier  {

  MyProviderBasketClient();

  List<String> _basket = [];
  int _total = 0;

  int get getTotal => _total;
  set setTotal(int set) {
    _total = set;

    notifyListeners();
  } 

  addBasket(String name){
    _total++;
    _basket.add(name);

    notifyListeners();
  }
  removeBasket(String name){
    _total = 0;
    _basket.removeWhere((element) => element == name);

    notifyListeners();
  }

}