part of 'stocks_bloc.dart';

abstract class StocksState extends Equatable {
  const StocksState();  

  @override
  List<Object> get props => [];
}
class StocksInitial extends StocksState {}
