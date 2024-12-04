// ignore_for_file: prefer_const_constructors

import 'package:carrental/data/models/car_model.dart';
import 'package:carrental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CardListingScreen extends StatelessWidget {
  CardListingScreen({super.key});

  final List<CarModel> cars = [
    CarModel(model: "Audi", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    CarModel(model: "Audi", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    CarModel(model: "Audi", distance: 870, fuelCapacity: 50, pricePerHour: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) => CarCard(car: cars[index]),
      ),
    );
  }
}
