import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  String image;
  String name;
  int price;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(left: 8),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image)),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    ]);
  }
}
