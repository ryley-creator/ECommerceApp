// ignore_for_file: unnecessary_string_interpolations, must_be_immutable
import 'package:ecommerce/bloc/product_bloc.dart';
import 'package:ecommerce/pages/detailed_info_page.dart';
import 'package:ecommerce/widgets/product_box.dart';
import 'package:ecommerce/widgets/search_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(LoadProducts()),
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          backgroundColor: Colors.white60,
          title: SvgPicture.asset('assets/icons/stylish_home_page.svg'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: auth.currentUser!.photoURL != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        auth.currentUser!.photoURL!,
                      ),
                      radius: 18,
                    )
                  : const CircleAvatar(child: Icon(Icons.person), radius: 18),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    SearchField(),
                    SizedBox(height: 5),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final firstIndex = index * 2;
                          final secondIndex = firstIndex + 1;
                          if (firstIndex >= state.products.length)
                            return SizedBox();
                          final firstProduct = state.products[firstIndex];
                          final secondProduct =
                              secondIndex < state.products.length
                              ? state.products[secondIndex]
                              : null;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12, top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailedInfoPage(
                                          product: state.products[firstIndex],
                                        ),
                                      ),
                                    ),
                                    child: ProductBox(
                                      id: state.products[firstIndex].id,
                                      description: firstProduct.description,
                                      imageUrl: state.products[index].imageUrl,
                                      name: firstProduct.name,
                                      price: firstProduct.price,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: secondProduct != null
                                      ? GestureDetector(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailedInfoPage(
                                                    product: state
                                                        .products[secondIndex],
                                                  ),
                                            ),
                                          ),
                                          child: ProductBox(
                                            id: state.products[secondIndex].id,
                                            description:
                                                secondProduct.description,
                                            imageUrl:
                                                state.products[index].imageUrl,
                                            name: secondProduct.name,
                                            price: secondProduct.price,
                                          ),
                                        )
                                      : const SizedBox(),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ProductError) {
              return Center(child: Text('${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
