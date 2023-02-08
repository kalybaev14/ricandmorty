import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/apptextstyles.dart';
import 'package:rickandmorty/feature/data/repo/rick_repo.dart';
import 'package:rickandmorty/presentation/screens/detail_screen.dart/cubit/detail_cubit.dart';
import 'package:rickandmorty/presentation/screens/detail_screen.dart/stack_widget.dart';
import 'detail_widget.dart';

class DetailPerson extends StatelessWidget {
  const DetailPerson({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DetailCubit(repo: context.read<RickRepoImpl>())
          ..getdetailPerson(id: id),
        child: BlocBuilder<DetailCubit, DetailStates>(
          builder: (context, state) {
            if (state is DetailSuccesStates) {
              return Column(
                children:  [
                   StackWidget(person: state.person,),
                  const SizedBox(height: 24),
                  Text(state.person.name??'',
                    style: ApptextStyles.roboto34w400,
                  ),
                  Text(
                    state.person.status??'',
                    style: ApptextStyles.roboto10w600,
                  ),
                  DetailWidget(person: state.person,)
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            
          },
        ),
      ),
    );
  }
}
