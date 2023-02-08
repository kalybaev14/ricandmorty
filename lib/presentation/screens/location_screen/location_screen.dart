import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/presentation/screens/location_screen/location_cubit.dart';

import '../../../feature/data/repo/rick_repo.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  static  int pagenumber=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            LocationCubit(repo: context.read<RickRepoImpl>())..getlocation(page: pagenumber),
        child: BlocConsumer<LocationCubit, LocationStates>(
          listener: (context, state)async {
            if(state is LocationLoadingStates){
                await Future.delayed(const Duration(milliseconds: 400));
            }
          },
            builder: (context, state) {
          if (state is LocationSuccesStates) {
              log(state.result.length.toString());
            return ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.black,
                  child: const Center(child: Text('lll')),
                ),
              ),
              itemCount: 10,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
