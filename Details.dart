import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final item;
  const Details({super.key,this.item});
  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.grey
            ),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shop_2_outlined,color: Colors.black,),
                Text("   Al-Mujaidi "),
                Text("Shoping ",style: TextStyle(
                  color: Colors.orange
                ),)
              ],
            ),
        ),
        endDrawer: Drawer(),
         bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          selectedItemColor: Colors.orange,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_sharp),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "",
            ),
          ],
        ),
       
        body: ListView(
          children: [
            Image.asset(widget.item["image"],width: 250,height: 250,fit: BoxFit.fill,),
            Container(child: Text(widget.item["title"],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
            Container(child: Text(widget.item["subtitle"],
            style: TextStyle(
              color: Colors.grey[800]
            ),
            textAlign: TextAlign.center,)),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(widget.item["price"],
            style: TextStyle(
              color: Colors.orange
            ),
            textAlign: TextAlign.center,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("color:  "),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange,width: 2)
                  // border: Border.all(s)
                ),
              ),
              Text("  gray     "),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  
                ),
              ),
              Text("  black"),
              
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text("size: 20  30  35",textAlign: TextAlign.center,))
           ,Padding(
             padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
             child: MaterialButton(
              color: Colors.black,
              onPressed: (){
                Navigator.pop(context, '${widget.item["title"]} added to cart');
              }, child: Text("add to cart",style: TextStyle(color: Colors.white),),
             ),
           )
          ],
        ),
      );
    
  }
}