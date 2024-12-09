// ignore_for_file: depend_on_referenced_packages




import 'package:carrental/injection_container.dart';
import 'package:carrental/presentation/bloc/car_bloc.dart';
import 'package:carrental/presentation/bloc/car_event.dart';
import 'package:carrental/presentation/pages/onboarding_page.dart';
// import 'package:carrental/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> getIt<CarBloc>()..add(LoadCarsPressed()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}
