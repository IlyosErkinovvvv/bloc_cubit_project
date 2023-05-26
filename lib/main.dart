import 'package:bloc_cubit_project/cubit/home/home_cubit.dart';
import 'package:bloc_cubit_project/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) async {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => HomeCubit()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.router.onGenerate,
    );
  }
}
