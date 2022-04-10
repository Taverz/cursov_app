import 'package:flutter_app/pages/preloader/preloader.dart';
import 'package:flutter_app/provider/basket.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'assets/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(contextBuilder)=> MyProviderBasketClient())
      ],
      child:  
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home:const PreloaderPage(),
        initialRoute: '/',
        onGenerateRoute:
          (RouteSettings settings) =>
            RouterApp().generateRoute(settings),
        // navigatorKey: navigatorKey,
      ),
    );
  }
}

