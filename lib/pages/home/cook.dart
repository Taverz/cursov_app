import 'package:flutter/material.dart';

class Cook extends StatefulWidget {
  const Cook({ Key? key }) : super(key: key);

  @override
  _CookState createState() => _CookState();
}

class _CookState extends State<Cook> {

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


  List<bool>? tapList;

  @override
  void initState() {
     tapList = List.generate(list.length, (index)=> false);
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                const SizedBox(width: 14,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const Spacer(),
                const Text(
                  "Поставщик", 
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/chat");
                  },
                  child: Icon(Icons.messenger, color: Colors.blue,),
                ),
                const SizedBox(width: 14,),
              ],
            ),
          ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: list.length,
            itemBuilder: (context, index){
             
              return _itemElem(list, index);
            }
          ),
        ),
         InkWell(
            onTap: (){
              Navigator.pushNamed(context, "/clientinfo");
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.grey
              ),
              padding: const EdgeInsets.all(15),
              child: const Center(
                child: Text("Наборы"),
              ),
            ),
          ),
      ],
    );
  }

  Widget _itemElem(List list,int index){
    return InkWell(
      onTap: (){  
        setState(() {
          tapList![index] = !tapList![index];
          print("TAP "+tapList![index].toString());
        });
      },
      onLongPress: (){
        //route
      },
      child: 
      // tapList![index] ? 
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width:tapList![index] ?  2 :0 , color: tapList![index] ?  Colors.black : Colors.green, ),
          color: Colors.green
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(15),
        child: Text(list[index].toString()),
      )
      // :
      // Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.all(Radius.circular(12)),
      //     border: Border.all(width: 0, color: Colors.green, ),
      //     color: Colors.green
      //   ),
      //   padding: EdgeInsets.all(20),
      //   margin: EdgeInsets.all(15),
      //   child: Text(list[index].toString()),
      // ),
    );
  }
}