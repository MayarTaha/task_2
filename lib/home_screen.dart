import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
 static const String routeName ='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<String>imagePath=[
   'https://i5.walmartimages.com/asr/51a44ce2-16fa-4e7c-ab2a-c941d4644b79_1.9d9200b24b5fd8369c03b55a73caebfd.jpeg',
   'https://th.bing.com/th/id/OIP.DlfjcssCl_3yFyXJMGMkCwAAAA?rs=1&pid=ImgDetMain',
   'https://m.media-amazon.com/images/I/71tPImfYerL._AC_UL1500_.jpg',
   'https://i.pinimg.com/736x/c2/64/90/c26490bd94e4bc445daab3592d82e49d.jpg',
   'https://th.bing.com/th/id/OIP.uUiYROkue4yEL1DUF0lDUgHaHa?w=535&h=535&rs=1&pid=ImgDetMain',
   'https://th.bing.com/th/id/R.d3cb4122f0be687557f21f540ff37fd2?rik=itt99qNO%2b2tedQ&pid=ImgRaw&r=0',
   'https://www.mynavyexchange.com/products/images/xlarge/13546070_001.jpg',
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shoe Store',style: TextStyle(color: Colors.white,fontSize: 30),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          Icon(Icons.shopping_cart,color: Colors.white,size: 30,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) {
                return Slidable(
                 endActionPane: ActionPane(motion: DrawerMotion(),
                     children: [SlidableAction(
                       onPressed: (context){
                         setState(() {
                           imagePath.removeAt(index);
                         });

                       },
                       label:'Delete',
                       backgroundColor: Colors.redAccent,
                       icon: Icons.delete,
                       borderRadius: BorderRadius.circular(20),
                       spacing: 20,
                     )]),
                  child: Card(
                    shape: Border.all(color: Colors.black,width: 3,),
                  child:Column(
                    children: [
                      Image(
                        image: NetworkImage(imagePath[index].toString(),),
                     ),
                      SizedBox(height: 5,),
                      InkWell(
                        child: Align(
                          alignment:Alignment.bottomRight,
                          child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.grey
                           ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Add To Cart',style: TextStyle(color: Colors.black,fontSize: 30),),
                            ),
                            width: 200,
                          ),
                        ),
                      )
                    ],
                  ),
                                ),
                );
              },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  }, itemCount: imagePath.length),
            )
          ],
        ),
      ),
    );
  }
}
