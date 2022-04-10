import 'dart:async';
import 'package:flutter/material.dart';

class PreloaderPage extends StatefulWidget {
  const PreloaderPage({ Key? key }) : super(key: key);

  @override
  _PreloaderPageState createState() => _PreloaderPageState();
}

class _PreloaderPageState extends State<PreloaderPage> {

  late Timer _timer;

  @override
  void initState() {
    _timer  = Timer(const Duration(seconds: 3), ((){
      Navigator.pushNamed(context, "/login");
    }));
    super.initState();
  }

  @override
  void dispose() {
    if(_timer.isActive)
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.orange,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}