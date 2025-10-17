import 'package:ecommerce/models/product_model.dart';

class CartModel {
  final ProductModel product;
  final int amount;

  CartModel({required this.amount, required this.product});

  CartModel copyWith({ProductModel? product, int? amount}) {
    return CartModel(
      amount: amount ?? this.amount,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() => {'id': product.id, 'amount': amount};

  factory CartModel.fromMap(Map<String, dynamic> data, ProductModel product) {
    return CartModel(amount: data['amount'], product: product);
  }
}
