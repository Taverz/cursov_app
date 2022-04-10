

import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({ Key? key }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child:Icon(Icons.arrow_back, size: 18,) ,
                  ),
                  Spacer(),
                  Expanded(child: Text("Заказ", style: TextStyle(fontSize: 18),)),
                  Spacer(),
                  SizedBox(width: 5,)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.blue.withOpacity(0.5),
                ),
              margin: EdgeInsets.all(15),
              width: double.infinity,
              
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text("Описание", style: TextStyle(color: Colors.grey),)
              ),
            ),
          ),
          //description
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.blue.withOpacity(0.5),
                ),
              margin: EdgeInsets.all(15),
              width: double.infinity,
              
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text("Описание", style: TextStyle(color: Colors.grey),)
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.green.withOpacity(0.6)
                ),
                child: Center(
                  child: Text("Выполнить"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}