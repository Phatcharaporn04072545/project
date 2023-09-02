import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final Color? itemColor;

  const ItemTile({
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    this.itemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 100,
          ),
          SizedBox(height: 8),
          Text(
            itemName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            itemPrice,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Hello',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Let's go buy some home medical equipment",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 4,
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'ITEM',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  String imagePath = 'assets/${index + 1}.jpg';
                  return ItemTile(
                    itemName: 'Item $index',
                    itemPrice: '\$${index * 10}',
                    imagePath: imagePath,
                    itemColor: Colors.blue,
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

void main() {
  runApp(MaterialApp(
    home: Page1(),
  ));
}
