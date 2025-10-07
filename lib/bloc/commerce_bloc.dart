import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'commerce_event.dart';
part 'commerce_state.dart';

class CommerceBloc extends Bloc<CommerceEvent, CommerceState> {
  CommerceBloc() : super(CommerceInitial());
}
