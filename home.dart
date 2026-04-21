import 'package:flutter/material.dart';
import 'package:untitled/Details.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _home();
}

class _home extends State<home> {
  List Catgories = [
    {"iconName": Icons.laptop_chromebook, "title": "LAPTOP"},
    {"iconName": Icons.phone_android, "title": "Mopile"},
    {"iconName": Icons.electric_bike, "title": "pike"},
    {"iconName": Icons.card_giftcard_sharp, "title": "Gifts"},
  ];
  List items = [
    {
      "image": "images/1.png",
      "title": "watch",
      "subtitle": "ساعه رقمية ذكية الاصلي",
      "price": "350\$",
    },
    {
      "image": "images/2.png",
      "title": "watch",
      "subtitle": "ساعه رقمية ذكية الاصلي",
      "price": "350\$",
    },
    {
      "image": "images/1.png",
      "title": "watch",
      "subtitle": "ساعه رقمية ذكية الاصلي",
      "price": "350\$",
    },
    {
      "image": "images/2.png",
      "title": "watch",
      "subtitle": "ساعه رقمية ذكية الاصلي",
      "price": "350\$",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(15, 158, 158, 158),
              filled: true,
              // hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
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
        body: Container(
          height: double.infinity,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "catgories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemCount: Catgories.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(right: 30, left: 30),
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(54, 66, 66, 66),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(Catgories[index]["iconName"], size: 40),
                        ),
                        Text(Catgories[index]["title"]),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  "Best Selling",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                itemCount: items.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () async {
          
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => 
              Details(item: items[index]),
                      ),
                    );
                    if (result != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$result')),
            );
          }
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey,
                          child: Image.asset(
                            items[index]["image"],
                            fit: BoxFit.fill,
                            width: 200,
                            height: 200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            items[index]["title"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          items[index]["subtitle"],
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          items[index]["price"],
                          style: TextStyle(
                            color: const Color.fromRGBO(218, 185, 3, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
