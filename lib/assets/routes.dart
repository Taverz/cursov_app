import 'package:flutter_app/pages/chat/chat_page.dart';
import 'package:flutter_app/pages/client/client_info.dart';
import 'package:flutter_app/pages/client/client_info_last.dart';
import 'package:flutter_app/pages/home/home_page.dart';
import 'package:flutter_app/pages/login/login_page.dart';
import 'package:flutter_app/pages/order/order_page.dart';
import 'package:flutter_app/pages/preloader/preloader.dart';
import 'package:flutter/material.dart';

class RouterApp {
  // RouterApp(this.context);

  // BuildContext context;

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (_) => PreloaderPage(), settings: settings);
          
          case '/login':
            return MaterialPageRoute(
                builder: (_) => LoginPage(), settings: settings);

          case '/orderpage':
            return MaterialPageRoute(
                builder: (_) => OrderPage(), settings: settings);

          case '/main':
            return MaterialPageRoute(
                builder: (_) => HomePage(), settings: settings);
          
          case '/chat':
            return MaterialPageRoute(
                builder: (_) => ChatPage(), settings: settings);
          
          case '/clientinfo':
            return MaterialPageRoute(
                builder: (_) => ClientInfo(), settings: settings);
          
          case '/clientinfolast':
            return MaterialPageRoute(
                builder: (_) => ClientInfoLast(), settings: settings);

          default:
            return MaterialPageRoute(
                builder: (_) => HomePage(), settings: settings);
    }
  }
}

abstract class MyNavigation {
  //TODO: прочитать и узнать разницу
  //Вынес чтобы не допустить ошибку черного экрана и вылета из приложения
  static back(BuildContext context)=> Navigator.of(context).pop(); //Navigator.pop(context); 
}