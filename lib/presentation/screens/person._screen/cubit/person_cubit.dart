import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rickandmorty/feature/domain/entity/filter_entity.dart';
import 'package:rickandmorty/feature/domain/repo/rick_repo.dart';

import '../../../../feature/domain/entity/rickandmorty_entity.dart';

class PersonCubit extends Cubit<PersonStates> {
  PersonCubit({required this.repo}) : super(InitialPersonStetes(results: []));
  final RickRepo repo;
  List<Results> resultList = [];
  FilterEntity filterEntity = FilterEntity();
  int currentpage = 1;
  int maxpage = 1;

  Future<void> getPersons({required FilterEntity filtermodel}) async {
    if (filtermodel != filterEntity) {
      currentpage = 1;
      resultList.clear();
    }
   
    if (currentpage <= maxpage) {
      final data = await repo.getAllperson(
          filterEntity: filtermodel.copyWith(currentpage: currentpage));

      if (data.errormessage == null) {
        maxpage = data.model?.info?.pages ?? 1;
        filterEntity = filtermodel;
        currentpage++;
        resultList.addAll(data.model?.results ?? []);
        emit(SuccesPersonStetes(
          results: resultList,
          isloading: false,
          info: data.model?.info,
        ));
      } else {
        emit(
            ErrorPersonStetes(errortext: data.errormessage ?? '', results: []));
      }
    }
  }
}

abstract class PersonStates {
  final List<Results> results;
  PersonStates({
    required this.results,
  });
}

class LoadingPersonStetes extends PersonStates {
  final List<Results> results;
  LoadingPersonStetes({
    required this.results,
  }) : super(results: results);
}

class InitialPersonStetes extends PersonStates {
  final List<Results> results;
  InitialPersonStetes({
    required this.results,
  }) : super(results: results);
}

class SuccesPersonStetes extends PersonStates {
  SuccesPersonStetes({
    required this.results,
    this.info,
    this.isloading = false,
  }) : super(results: results);

  final List<Results> results;
  final Info? info;
  final bool isloading;
}

class ErrorPersonStetes extends PersonStates {
  ErrorPersonStetes({required this.errortext, required this.results})
      : super(results: results);
  final String errortext;
  final List<Results> results;
}
