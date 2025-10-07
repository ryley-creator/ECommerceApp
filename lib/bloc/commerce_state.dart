part of 'commerce_bloc.dart';

sealed class CommerceState extends Equatable {
  const CommerceState();
  
  @override
  List<Object> get props => [];
}

final class CommerceInitial extends CommerceState {}
