import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FirebaseFirestore firestore;
  FavoriteBloc({required this.firestore}) : super(FavoriteState()) {
    on<LoadFavorites>(onLoadFavorites);
    on<ToggleFavorite>(toggleFavorite);
  }

  Future<void> onLoadFavorites(
    LoadFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    final stream = firestore
        .collection('product')
        .where('isFavorite', isEqualTo: true)
        .snapshots();
    await emit.forEach(
      stream,
      onData: (snapshot) {
        final favorites = snapshot.docs.map((doc) {
          final data = doc.data();
          return ProductModel.fromMap(data, doc.id);
        }).toList();
        return FavoriteLoaded(favorites: favorites);
      },
    );
  }

  Future<void> toggleFavorite(
    ToggleFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final productRef = firestore.collection('product').doc(event.product.id);
    final snapshot = await productRef.get();
    final current = snapshot['isFavorite'] as bool;

    await productRef.update({'isFavorite': !current});
  }
}
