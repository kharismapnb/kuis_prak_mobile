import 'package:flutter/material.dart';
import 'package:kuis_prak_mobile/pages/login_page.dart';
import 'detail_order_page.dart';
import '../models/food_item.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  // List of food items to display in the grid
  final List<FoodItem> foodItems = [
    FoodItem(
      name: 'Noodles',
      imageUrl:
          'https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/menu_img/img_noodle_menu.webp',
      price: 15000,
    ),
    FoodItem(
      name: 'Nasi Goreng',
      imageUrl:
          'https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/menu_img/img_noodle_menu.webp',
      price: 25000,
    ),
    FoodItem(
      name: 'Pizza',
      imageUrl:
          'https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/menu_img/img_noodle_menu.webp',
      price: 30000,
    ),
    FoodItem(
      name: 'Sushi',
      imageUrl:
          'https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/menu_img/img_noodle_menu.webp',
      price: 35000,
    ),
    FoodItem(
      name: 'Martabak',
      imageUrl:
          'https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/menu_img/img_noodle_menu.webp',
      price: 20000,
    ),
    FoodItem(
      name: 'Mie Dokdok',
      imageUrl:
          'https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/menu_img/img_noodle_menu.webp',
      price: 15000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Selamat Datang $username',
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/banner/bg_banner.webp',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
            SizedBox(height: 20),
            Text('Mau makan apa hari ini?', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final food = foodItems[index];
                  return GridTile(
                    child: Image.network(
                      food.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.black54,
                      title: Text(food.name),
                      subtitle: Text('Rp ${food.price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailOrderPage(
                                foodName: food.name,
                                price: food.price,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
