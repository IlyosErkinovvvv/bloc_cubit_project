import 'package:bloc_cubit_project/cubit/home/home_cubit.dart';
import 'package:bloc_cubit_project/cubit/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => _scaffold(context, state),
    );
  }

  Scaffold _scaffold(BuildContext context, HomeState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Work with Cubit & API')),
      body: Builder(
        builder: (context) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is HomeCompleteState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(state.data[index].name.toString()),
                    subtitle: Text(state.data[index].username.toString()),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
