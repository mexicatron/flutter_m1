import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tienda de Ropa",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ProductItemCard(
            imageUrl:
                'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2105602e944f44d887ccae36012fe7dc_9366/Camiseta_de_Visitante_Real_Madrid_22-23_Purpura_HA2660_01_laydown.jpg',
            nameProduct: 'Camiseta de Futbol',
            price: '350',
            discount: '17%',
          ),
          ProductItemCard(
            imageUrl:
                'https://assets.adidas.com/images/w_1920,h_1920,f_auto,q_auto,fl_lossy,c_fill,g_auto/0f977a3f12a64b549cf7aa8b00d393b6_9366/FP9597_01_laydown.jpg',
            nameProduct: 'Short de Futbol',
            price: '150',
            discount: '50%',
          ),
        ],
      ),
    );
  }
}

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.imageUrl,
    required this.price,
    this.discount,
    required this.nameProduct,
    this.description,
  });

  final String imageUrl;
  final String price;
  final String? discount;
  final String nameProduct;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 250,
                ),
                discount != null
                    ? SizedBox(
                        width: 70,
                        height: 50,
                        child: Card(
                          margin: const EdgeInsets.all(4),
                          color: const Color.fromARGB(255, 97, 9, 2),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              discount!,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 247, 194, 23),
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Container(
              width: 200,
              height: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            nameProduct,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.favorite_border),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
