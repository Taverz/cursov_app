
import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class ClientInfo extends StatelessWidget {
  const ClientInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back, size: 18,) ,
                  ),
                  const Spacer(),
                  const Expanded(child: Text("Подробнее", style: TextStyle(fontSize: 18),)),
                  const Spacer(),
                  const SizedBox(width: 25,)
                ],
              ),
            ),
          ),
          //photo
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(15),
               decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Colors.green.withOpacity(0.5),
                ),
              width: double.infinity,
              child: OptimizedCacheImage(
                  imageUrl: 
                  "https://xcook.info/wp-content/cache/thumb/83/9236ee8db8c4483_750x375.jpg",
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(8)
                        ));
                  },
                  // progressIndicatorBuilder: (context, url, downloadProgress) => 
                  //         CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          //description
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Colors.blue.withOpacity(0.5),
                ),
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text("Описание", style: TextStyle(color: Colors.grey),)
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Colors.orange.withOpacity(0.6)
                ),
                child: const Center(
                  child: Text("Добавить"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}