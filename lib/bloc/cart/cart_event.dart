part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final ProductModel product;
  const AddToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends CartEvent {
  final ProductModel product;
  const RemoveFromCart(this.product);

  @override
  List<Object> get props => [product];
}

class IncreaseAmount extends CartEvent {
  final ProductModel product;
  const IncreaseAmount(this.product);

  @override
  List<Object> get props => [product];
}

class DecreaseAmount extends CartEvent {
  final ProductModel product;
  const DecreaseAmount(this.product);

  @override
  List<Object> get props => [product];
}
