import 'package:ecommerce/models/cart_model.dart';
import 'package:flutter/material.dart';

class PaymetButton extends StatelessWidget {
  const PaymetButton({super.key, required this.cart});
  final List<CartModel> cart;
  @override
  Widget build(BuildContext context) {
    double total = cart.fold<double>(
      0,
      (sum, item) => sum + (item.product.price * item.amount),
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Text(
                total.toStringAsFixed(1),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Proceed Paymet',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
