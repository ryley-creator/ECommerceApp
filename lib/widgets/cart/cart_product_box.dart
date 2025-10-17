import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/widgets/cart/cart_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductBox extends StatelessWidget {
  const CartProductBox({super.key, required this.cartItem});
  final CartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  cartItem.product.imageUrl,
                  width: 130,
                  height: 125,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Category: ${cartItem.product.category}',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  CartPrice(price: cartItem.product.price),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context.read<CartBloc>().add(
                          IncreaseAmount(cartItem.product),
                        ),
                        icon: Icon(Icons.add_circle, color: Colors.blue),
                      ),
                      Text(cartItem.amount.toString()),
                      IconButton(
                        onPressed: () => context.read<CartBloc>().add(
                          DecreaseAmount(cartItem.product),
                        ),
                        icon: Icon(Icons.remove_circle, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(height: 0.5, color: Colors.grey),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total order (${cartItem.amount}) :',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Text(
                '\$${(cartItem.amount * cartItem.product.price).toStringAsFixed(1)}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
