// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ProductBloc() : super(ProductState()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final snapshot = await firestore.collection('product').get();

      print("Documents found: ${snapshot.docs.length}");

      final products = snapshot.docs.map((doc) {
        print("📦 Product: ${doc.id}, data: ${doc.data()}");
        return ProductModel.fromMap(doc.data(), doc.id);
      }).toList();

      emit(ProductLoaded(products));
    } catch (e) {
      print('Error: $e');
      emit(ProductError(e.toString()));
    }
  }
}
