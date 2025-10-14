// ignore_for_file: sort_child_properties_last, prefer_interpolation_to_compose_strings
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widgets/cart_button.dart';
import 'package:flutter/material.dart';

class DetailedInfoPage extends StatefulWidget {
  const DetailedInfoPage({super.key, required this.product});
  final ProductModel product;

  @override
  State<DetailedInfoPage> createState() => _DetailedInfoPageState();
}

class _DetailedInfoPageState extends State<DetailedInfoPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.imageUrl,
                    height: 290,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(product.description),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '\$${product.price + 100}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Product Details',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(height: 8),
              AnimatedCrossFade(
                firstChild: Text(
                  widget.product.detailedInfo,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
                secondChild: Text(widget.product.detailedInfo),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
              GestureDetector(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: Text(
                  _isExpanded ? 'Show less' : 'Show more',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CartButton(
                      icon: const Icon(Icons.bar_chart, color: Colors.white),
                      text: 'Go to cart',
                      color: Colors.blue,
                    ),
                    CartButton(
                      icon: const Icon(Icons.fingerprint, color: Colors.white),
                      text: 'Buy now',
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
