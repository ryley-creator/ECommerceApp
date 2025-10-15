import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final DateTime createdAt;
  final String detailedInfo;
  final bool isFavorite;
  final int amount;

  ProductModel({
    required this.detailedInfo,
    required this.category,
    required this.createdAt,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.isFavorite,
    required this.amount,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data, String id) =>
      ProductModel(
        amount: data['amount'],
        isFavorite: data['isFavorite'],
        detailedInfo: data['productDetails'] ?? '',
        category: data['category'] ?? '',
        createdAt: (data['createdAt'] as Timestamp).toDate(),
        description: data['description'] ?? '',
        id: id,
        imageUrl: data['imageUrl'] ?? '',
        name: data['name'] ?? '',
        price: data['price'] ?? '',
      );
  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    DateTime? createdAt,
    String? detailedInfo,
    bool? isFavorite,
    int? amount,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      detailedInfo: detailedInfo ?? this.detailedInfo,
      isFavorite: isFavorite ?? this.isFavorite,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'createdAt': Timestamp.fromDate(createdAt),
      'productDetails': detailedInfo,
      'isFavorite': isFavorite,
      'amount': amount,
    };
  }
}
