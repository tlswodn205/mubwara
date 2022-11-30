import 'package:flutter/material.dart';

class NewShopPage extends StatelessWidget {
  final Image image;
  final String shop_name;

  const NewShopPage({
    required this.image,
    required this.shop_name,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: image,
          ),
          const SizedBox(height: 16.0),
          Text(
            shop_name,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
