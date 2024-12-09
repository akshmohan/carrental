// ignore_for_file: depend_on_referenced_packages

import 'package:carrental/data/datasources/firebase_car_data_soure.dart';
import 'package:carrental/domain/repositories/car_repository.dart';
import 'package:carrental/presentation/bloc/car_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'data/repositories/car_repo_impl.dart';
import 'domain/usecases/fetch_cars.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
 try{
    getIt.registerLazySingleton(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton(() => FirebaseCarDataSoure(firestore: getIt<FirebaseFirestore>()));

    getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(getIt<FirebaseCarDataSoure>()));

    getIt.registerLazySingleton<FetchCars>(() => FetchCars(getIt<CarRepository>()));

    getIt.registerLazySingleton(() => CarBloc(fetchCars: getIt<FetchCars>()));
 } catch(e){
   throw Exception(e.toString());
 }

}