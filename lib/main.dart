import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListProduct(),
    );
  }
}

class Product {
  final String nme_prdct;
  final String imgurl;
  final String dscr;
  final double price;

  Product(this.nme_prdct, this.imgurl, this.dscr, this.price);
}

final List<Product> products = [
  Product(
      'Nike Air Mac 98', 'assets/images/sepatudia.png', 'Style Runner!', 900.0),
  Product('Nike Blazer', 'assets/images/sepatudia.png', 'Style Skate!', 550.0),
  Product('Nike old Skool', 'assets/images/sepatudia.png', 'Skater!', 400.0),
  Product('Nike Balance', 'assets/images/sepatudia.png', 'Friend Day!', 290.0),
];

class ListProduct extends StatelessWidget {
  ListProduct({super.key, Key});

  final List<Color> colors = [
    const Color.fromARGB(255, 219, 166, 7),
    const Color.fromARGB(255, 129, 13, 13),
    const Color.fromARGB(255, 133, 200, 255),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Text('Shoes',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                Spacer(),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/crown-10716.png'),
                  radius: 24.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.nme_prdct,
                                style: const TextStyle(fontSize: 20.0)),
                            const SizedBox(height: 8.0),
                            Text(product.dscr),
                            const SizedBox(height: 8.0),
                            Text('${product.price}',
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Image.network(product.imgurl, width: 80.0, height: 80.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
