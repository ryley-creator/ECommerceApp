part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<ProductModel> products;
  const CartLoaded(this.products);

  double get totalPrice =>
      products.fold(0, (sum, item) => sum + item.price * item.amount);
  @override
  List<Object> get props => [products];
}

class CartError extends CartState {
  final String error;
  const CartError(this.error);

  @override
  List<Object> get props => [error];
}
