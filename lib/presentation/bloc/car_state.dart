import '../../data/models/car_model.dart';

abstract class CarState {}

class CarLoading extends CarState {}

class CarLoaded extends CarState {
  final List<CarModel> cars;

  CarLoaded(this.cars);
}

class CarLoadError extends CarState {
  final String message;

  CarLoadError({required this.message});
}
