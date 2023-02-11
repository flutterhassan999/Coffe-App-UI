import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coffee_name.dart';
import 'coffee_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List coffeeType = [
    [
      'Milky',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Strong',
      false,
    ],
    [
      'Cappucino',
      false,
    ],
  ];
  // tapped method
  void coffeeTypeSelected(int index) {
    setState(() {
      for(int i=0; i<coffeeType.length; i++){
        coffeeType[i][1]=false;   
      }
      coffeeType[index][1]=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.payment,
            ),
            label: 'Payment',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.0,vertical: 5.0),
            child: Text(
              "Enjoy your coffee",
              style: GoogleFonts.bebasNeue(
                fontSize: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Find your coffee ',
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            child: Expanded(
              child: ListView.builder(
                itemCount: coffeeType.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return CoffeeName(
                    Coffeename: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap:() {
                      coffeeTypeSelected(index);
                    },
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'assets/latte.jpg',
                  coffeeName: 'Lattee',
                  coffeePrice: '15.50',
                ),
                 CoffeeTile(
                  coffeeImagePath: 'assets/milk.jpg',
                  coffeeName: 'Milky',
                  coffeePrice: '20.50',
                ),
                 CoffeeTile(
                  coffeeImagePath: 'assets/strong.jpg',
                  coffeeName: 'Strong',
                  coffeePrice: '12.50',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
