import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/farm_entity.dart';
import '../../domain/usecases/create_farm.dart';

part 'farms_event.dart';
part 'farms_state.dart';

class FarmsBloc extends Bloc<FarmsEvent, FarmsState> {
  FarmsBloc(this.createFarm) : super(FarmsInitial()) {
    on<FarmsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final CreateFarm createFarm;

  Future<String?> createFarmBloc(FarmEntity farm) async {
    final result = await createFarm(CreateFarmParams(farm));
    return result.fold((l) => l.toString(), (r) => null);
  }
}
