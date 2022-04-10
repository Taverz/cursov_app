import 'package:flutter_app/provider/basket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Client extends StatefulWidget {
  const Client({ Key? key }) : super(key: key);

  @override
  _ClientState createState() => _ClientState();
}

class _ClientState extends State<Client> {
  List list = [
    "Эклеры",
    "Печенье",
    "Мороженое",
    "Молоко",
    "Куринное мясо",
    "Печнье",
    "Лук",
    "Сельд",
    "Форель",
    "Семга",
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child:  Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  SizedBox(width: 14,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Spacer(),
                  Consumer<MyProviderBasketClient>(
                    builder: (_, data, w){
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, "/orderpage");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Text(data.getTotal.toString())
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 14,),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (contexxt, index){
                  return _itemElem(list, index, context);
              }),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/clientinfo");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color:Colors.grey
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text("Наборы"),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _itemElem(List list,int index, BuildContext context){
    final provider = Provider.of<MyProviderBasketClient>(context, listen: false);
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.green
                  ),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  child: Text(list[index].toString()),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    provider.addBasket(list[index].toString());
                    print("TAP");
                  },
                  child: Container(
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.blue
                    ),
                    width: 45,
                    height: 45,
                  ),
                )
              ],
            ),
          ),
        );
  }
}