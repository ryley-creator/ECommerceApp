import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final FirebaseFirestore firestore;
  CartBloc({required this.firestore}) : super(CartState()) {
    on<LoadCart>(onLoadCart);
    on<AddToCart>(onAddToCart);
    on<RemoveFromCart>(onRemoveCart);
    on<DecreaseAmount>(onDecreaseAmount);
    on<IncreaseAmount>(onIncreaseAmount);
  }
  // Future<void> onLoadCart(LoadCart event, Emitter<CartState> emit) async {
  //   emit(CartLoading());
  //   try {
  //     final snpashot = await firestore.collection('product').get();
  //     final cartItems = snpashot.docs
  //         .map((doc) => ProductModel.fromMap(doc.data(), doc.id))
  //         .toList();
  //     emit(CartLoaded(cartItems));
  //   } catch (error) {
  //     emit(CartError(error.toString()));
  //   }
  // }

  Future<void> onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final snapshot = await firestore.collection('cart').get();
      final List<CartModel> cartItems = [];

      for (var doc in snapshot.docs) {
        final productDoc = await firestore
            .collection('product')
            .doc(doc['id'])
            .get();
        final product = ProductModel.fromMap(productDoc.data()!, productDoc.id);
        cartItems.add(CartModel.fromMap(doc.data(), product));
      }
      emit(CartLoaded(cartItems));
    } catch (error) {
      emit(CartError(error.toString()));
    }
  }

  // Future<void> onAddToCart(AddToCart event, Emitter<CartState> emit) async {
  //   if (state is CartLoaded) {
  //     final currentState = state as CartLoaded;
  //     final existingProductIndex = currentState.products.indexWhere(
  //       (item) => item.id == event.product.id,
  //     );
  //     List<ProductModel> updatedCart = List.from(currentState.products);
  //     if (existingProductIndex != -1) {
  //       final existingProduct = updatedCart[existingProductIndex];
  //       final newAmount = existingProduct.amount - 1;
  //       updatedCart[existingProductIndex] = existingProduct.copyWith(
  //         amount: newAmount,
  //       );
  //       await firestore.collection('product').doc(event.product.id).update({
  //         'amount': newAmount,
  //       });
  //     }
  //     emit(CartLoaded(updatedCart));
  //   }
  // }

  Future<void> onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final existingIndex = currentState.cart.indexWhere(
        (item) => item.product.id == event.product.id,
      );
      List<CartModel> updatedCart = List.from(currentState.cart);

      final newProductAmount = event.product.amount - 1;
      await firestore.collection('product').doc(event.product.id).update({
        'amount': newProductAmount,
      });
      if (existingIndex != -1) {
        final existing = updatedCart[existingIndex];
        final updated = existing.copyWith(amount: existing.amount + 1);
        updatedCart[existingIndex] = updated;

        await firestore.collection('cart').doc(event.product.id).update({
          'amount': updated.amount,
        });
      } else {
        final newCartItem = CartModel(amount: 1, product: event.product);
        updatedCart.add(newCartItem);
        await firestore.collection('cart').doc(event.product.id).set({
          'amount': 1,
          'product': event.product.id,
        });
      }
      emit(CartLoaded(updatedCart));
    }
  }

  Future<void> onRemoveCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedCart = currentState.cart
          .where((item) => item.product.id != event.product.id)
          .toList();
      emit(CartLoaded(updatedCart));
      await firestore.collection('product').doc(event.product.id).delete();
    }
  }

  // Future<void> onIncreaseAmount(
  //   IncreaseAmount event,
  //   Emitter<CartState> emit,
  // ) async {
  //   if (state is CartLoaded) {
  //     final currentState = state as CartLoaded;
  //     final updatedCart = currentState.products.map((product) {
  //       if (product.id == event.product.id) {
  //         final newAmount = product.amount + 1;
  //         firestore.collection('product').doc(product.id).update({
  //           'amount': newAmount,
  //         });
  //         return product.copyWith(amount: newAmount);
  //       }
  //       return product;
  //     }).toList();
  //     emit(CartLoaded(updatedCart));
  //   }
  // }

  Future<void> onIncreaseAmount(
    IncreaseAmount event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedCart = currentState.cart.map((item) {
        if (item.product.id == event.product.id) {
          return item.copyWith(amount: item.amount + 1);
        }
        return item;
      }).toList();
      await firestore.collection('cart').doc(event.product.id).update({
        'amount': FieldValue.increment(1),
      });
      emit(CartLoaded(updatedCart));
    }
  }

  // Future<void> onDecreaseAmount(
  //   DecreaseAmount event,
  //   Emitter<CartState> emit,
  // ) async {
  //   if (state is CartLoaded) {
  //     final currentState = state as CartLoaded;
  //     final updatedCart = currentState.products.map((product) {
  //       if (product.id == event.product.id && product.amount > 1) {
  //         final newAmount = product.amount - 1;
  //         firestore.collection('product').doc(product.id).update({
  //           'amount': newAmount,
  //         });
  //         return product.copyWith(amount: newAmount);
  //       }
  //       return product;
  //     }).toList();
  //     emit(CartLoaded(updatedCart));
  //   }
  // }

  Future<void> onDecreaseAmount(
    DecreaseAmount event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedCart = currentState.cart
          .where((item) {
            if (item.product.id == event.product.id) {
              if (item.amount > 1) {
                firestore.collection('cart').doc(event.product.id).update({
                  'amount': FieldValue.increment(-1),
                });
                return true;
              } else {
                firestore.collection('cart').doc(event.product.id).delete();
                return false;
              }
            }
            return true;
          })
          .map(
            (item) => item.product.id == event.product.id
                ? item.copyWith(amount: item.amount - 1)
                : item,
          )
          .toList();
      emit(CartLoaded(updatedCart));
    }
  }
}
