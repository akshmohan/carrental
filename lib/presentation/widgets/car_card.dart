// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carrental/data/models/car_model.dart';
import 'package:carrental/presentation/pages/card_details_page.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final CarModel car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CardDetailsPage(car: car)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (car.model == 'Toyota')
              Image.asset('assets/images/car_image.png')
            else if (car.model == 'Mercedes')
              Image.asset('assets/images/mercedes.png')
            else if (car.model == 'Kia')
              Image.asset('assets/images/kia.png'),
            Text(
              car.model,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/gps.png'),
                        Text('${car.distance.toStringAsFixed(0)} km'),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Row(
                      children: [
                        Image.asset('assets/images/pump.png'),
                        Text(' ${car.fuelCapacity.toStringAsFixed(0)} L'),
                      ],
                    )
                  ],
                ),
                Text(
                  "\$${car.pricePerHour.toStringAsFixed(2)}/h",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
