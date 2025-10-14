import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
  });
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 305,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4),
                Text(
                  maxLines: 2,
                  description,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${price}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
