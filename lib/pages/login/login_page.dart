
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 2) ,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "/main", arguments: "client");
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      padding:const EdgeInsets.all(15),
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.green
                      ),
                      child: const Text("Клиент"),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "/main", arguments: "cook");
                    },
                    child: Container(
                      width: double.infinity,
                      padding:const EdgeInsets.all(15),
                      margin:const EdgeInsets.all(20),
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.green
                      ),
                      child: const Text("Поставщик"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}