import 'package:carrental/data/models/car_model.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSoure {
  final FirebaseFirestore firestore;

  FirebaseCarDataSoure({required this.firestore});

  Future<List<CarModel>> getCars() async {
    final snapshot = await firestore.collection('cars').get();
    return snapshot.docs
        .map((doc) => CarModel.fromMap(doc.data()))
        .toList();
  }
  
}