import 'package:ecommerce/bloc/favorite/favorite_bloc.dart';
import 'package:ecommerce/pages/detailed_info_page.dart';
import 'package:ecommerce/widgets/product_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Favorites', style: TextStyle(fontWeight: FontWeight.w700)),
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FavoriteLoaded) {
            if (state.favorites.isEmpty) {
              return Center(
                child: Text(
                  'No favorites yet',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                final firstIndex = index * 2;
                final secondIndex = firstIndex + 1;
                if (firstIndex >= state.favorites.length) {
                  return const SizedBox();
                }
                final firstProduct = state.favorites[firstIndex];
                final secondProduct = secondIndex < state.favorites.length
                    ? state.favorites[secondIndex]
                    : null;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailedInfoPage(
                                product: state.favorites[firstIndex],
                              ),
                            ),
                          ),
                          child: ProductBox(product: firstProduct),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: secondProduct != null
                            ? GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailedInfoPage(
                                      product: state.favorites[secondIndex],
                                    ),
                                  ),
                                ),
                                child: ProductBox(product: secondProduct),
                              )
                            : SizedBox(),
                      ),
                    ],
                  ),
                );
              },
              itemCount: state.favorites.length,
            );
          } else if (state is FavoriteError) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
