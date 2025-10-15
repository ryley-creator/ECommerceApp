part of 'favorite_bloc.dart';

class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorites extends FavoriteEvent {}

class ToggleFavorite extends FavoriteEvent {
  final ProductModel product;
  const ToggleFavorite(this.product);
  @override
  List<Object> get props => [product];
}
