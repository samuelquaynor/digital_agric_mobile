import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'farms_event.dart';
part 'farms_state.dart';

class FarmsBloc extends Bloc<FarmsEvent, FarmsState> {
  FarmsBloc() : super(FarmsInitial()) {
    on<FarmsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
