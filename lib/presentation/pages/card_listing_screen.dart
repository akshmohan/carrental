// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'package:carrental/data/models/car_model.dart';
import 'package:carrental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/car_bloc.dart';
import '../bloc/car_state.dart';

class CardListingScreen extends StatelessWidget {
  CardListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose your car"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is CarLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CarLoaded) {
              return ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (context, index) => CarCard(car: state.cars[index]),
              );
            } else if (state is CarLoadError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text("Something went wrong"));
            }
          },
        ));
  }
}
