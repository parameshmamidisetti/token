import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key? key,
    required this.itemImage,
  }) : super(key: key);

  final String itemImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          border: Border.all(color: Colors.black, width: 3.0),
          shape: BoxShape.circle,
        ),
        child: Image.network(
          itemImage,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
