import 'package:ecommerce/models/product_model.dart';

class CartModel {
  final ProductModel product;
  final String id;
  final int quantity;

  const CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory CartModel.fromMap(Map<String, dynamic> data, String id) => CartModel(
    id: id,
    product: ProductModel.fromMap(data['product'], data['id']),
    quantity: data['quantity'],
  );

  Map<String, dynamic> toMap() => {
    'id': product.id,
    'product': {
      'name': product.name,
      'description': product.description,
      'price': product.price,
      'imageUrl': product.imageUrl,
      'category': product.category,
      'detailedInfo': product.detailedInfo,
      'amount': product.amount,
      'isFavorite': product.isFavorite,
    },
    'quantity': quantity,
  };
}
