import 'package:carrental/data/models/car_model.dart';
import 'package:carrental/domain/repositories/car_repository.dart';

class FetchCars {
  final CarRepository repository;

  FetchCars(this.repository);
  
  Future<List<CarModel>> call() async{
  return await  repository.fetchCars(); 
  }
}
