part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<ProductModel> favorites;

  const FavoriteLoaded({required this.favorites});

  @override
  List<Object> get props => [favorites];
}

class FavoriteError extends FavoriteState {
  final String error;
  const FavoriteError(this.error);
  @override
  List<Object> get props => [error];
}
