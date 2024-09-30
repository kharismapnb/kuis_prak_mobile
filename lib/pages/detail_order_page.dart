import 'package:flutter/material.dart';

class DetailOrderPage extends StatefulWidget {
  final String foodName;
  final int price;

  DetailOrderPage({required this.foodName, required this.price});

  @override
  _DetailOrderPageState createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  final TextEditingController _quantityController = TextEditingController();
  int? totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Detail Order - ${widget.foodName}',
            style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.network(
                'https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/menu_img/img_noodle_menu.webp'),
            Text(widget.foodName, style: TextStyle(fontSize: 24)),
            Text('Rp ${widget.price}', style: TextStyle(fontSize: 24)),
            TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukan Jumlah',
                hintStyle: const TextStyle(color: Colors.purple),
                contentPadding: const EdgeInsets.all(8.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.purpleAccent,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colors.purpleAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                setState(() {
                  int quantity = int.parse(_quantityController.text);
                  totalPrice = widget.price * quantity;
                });
              },
              child: Text('Submit', style: TextStyle(color: Colors.white)),
            ),
            if (totalPrice != null)
              Text('\n\nTotal Harga: Rp $totalPrice',
                  style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
