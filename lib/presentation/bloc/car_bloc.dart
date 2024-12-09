// ignore_for_file: depend_on_referenced_packages

import 'package:carrental/presentation/bloc/car_event.dart';
import 'package:carrental/presentation/bloc/car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/fetch_cars.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final FetchCars fetchCars;

  CarBloc({required this.fetchCars}) : super(CarLoading()) {
    on<LoadCarsPressed>((event, emit) async {
      emit(CarLoading());

      try {
        final cars = await fetchCars();
        emit(CarLoaded(cars));
      } catch (e) {
        emit(CarLoadError(message: e.toString()));
      }
    });
  }
}
