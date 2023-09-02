import 'package:flutter/material.dart';
import 'package:tproject/models/widgets/itemtile.dart';

class page1 extends StatelessWidget {
  const page1({super.key});

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
              "Let's go buy somme home medical equipment",
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
              return ItemTile(
                itemName: 'Item $index',
                itemPrice: '\$${index * 4}',
                imagePath:
                    'assets/1.jpg', 
                     // กำหนดพาธของรูปภาพให้เป็น 'assets/1.jpg'
                itemColor: Colors.blue, // สีของรายการ (หากต้องการ)
              );
            },
          ))
        ],
      )),
    );
  }
}
