import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'predictions_event.dart';
part 'predictions_state.dart';

class PredictionsBloc extends Bloc<PredictionsEvent, PredictionsState> {
  PredictionsBloc() : super(PredictionsInitial()) {
    on<PredictionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
