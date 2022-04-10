import 'package:flutter_app/pages/home/client.dart';
import 'package:flutter_app/pages/home/cook.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String login = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child:
         login == "client" ?
          Client() 
        : 
        Cook()
        ,
      ),
    );
  }
}