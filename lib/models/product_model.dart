import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final DateTime createdAt;

  ProductModel({
    required this.category,
    required this.createdAt,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data, String id) =>
      ProductModel(
        category: data['category'] ?? '',
        createdAt: (data['createdAt'] as Timestamp).toDate(),
        description: data['description'] ?? '',
        id: id,
        imageUrl: data['imageUrl'] ?? '',
        name: data['name'] ?? '',
        price: data['price'] ?? '',
      );
}
