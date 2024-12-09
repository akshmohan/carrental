import 'package:carrental/data/datasources/firebase_car_data_soure.dart';
import 'package:carrental/data/models/car_model.dart';

import '../../domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSoure dataSoure;

  CarRepositoryImpl(this.dataSoure);

  @override
  Future<List<CarModel>> fetchCars() {
    return dataSoure.getCars();
  }
}
