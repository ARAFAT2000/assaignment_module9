import 'package:flutter/material.dart';
import 'package:untitled1/auth/auth_screen.dart';

import '../style/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// calculate ammount
 int calculateTotalAmount(){
        int total =0;
        for(var product in products){
          total += product.quantity * product.unitPrice;
        }
        return total;
 }
  ///increse count
  void increaseCount(int index){
    setState(() {
      products[index].quantity ++;
    });
  }



  ///decrese count
  void decreaseCount (int index){
 if(products[index].quantity>0){
   setState(() {
     products[index].quantity --;
   });
 }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        elevation: 0,
        actions: [
          Icon(Icons.search,color: Colors.black54,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('My Bag',style: AppTextStyle(),),
            ),
            ListView.builder(
              shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context , index){
              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(products[index].image,fit: BoxFit.cover,),

                        Expanded(
                            child: ListTile(

                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(products[index].name,style: AppTextStyle(),),
                                Icon(Icons.more_vert_rounded)
                              ],
                            ),
                              subtitle: Align(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Row(

                                    children: [
                                      Text("Color:${products[index].color}",style: TextStyle(
                                        color: Colors.grey
                                      )),
                                      SizedBox(width: 10,),
                                      Text("Size:${products[index].size}"),

                                    ],
                                  ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(

                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,

                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 2,
                                                )
                                              ]
                                          ),
                                          child: InkWell(
                                              onTap: ()=> decreaseCount(index),
                                              child: Icon(Icons.remove,color: Colors.black54,)),
                                        ),
                                        SizedBox(width: 5,),
                                        Text(products[index].quantity.toString()),
                                        SizedBox(width: 5,),
                                        Container(
                                          height: 30,
                                          width: 30,

                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 2,
                                                )
                                              ]
                                          ),
                                          child: InkWell(
                                              onTap: ()=> increaseCount(index),
                                              child: Icon(Icons.add,color: Colors.black54,)),
                                        ),
                                        Spacer(),
                                        Text("${products[index].unitPrice * products[index].quantity}",style: TextStyle(
                                          fontSize: 22,fontWeight: FontWeight.bold
                                        ),)
                                      ],
                                    )

                                  ],
                                ),

                              ),
                        ),

                        ),

                      ],
                    )
                  ],
                ),
              );
            }),

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Total ammount',style: TextStyle(

                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${calculateTotalAmount().toStringAsFixed(0)}\$',style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize:15
                      ),),
                    ),


                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.red,
                    fixedSize: Size(450, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                    onPressed: (){

                    }, child: Text('CHECK OUT'))
              ],
            ),

          ),
        ),
      ),
    );
  }
}
