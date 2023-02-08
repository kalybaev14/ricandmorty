import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/feature/domain/entity/detail_entity.dart';
import 'package:rickandmorty/feature/domain/repo/rick_repo.dart';

class DetailCubit extends Cubit<DetailStates>{
  DetailCubit({required this.repo}):super(DetailInitialStates());

  final RickRepo repo;

  Future<void>getdetailPerson({required int id})async{
    emit(DetailLoadingStates());
    final result=await repo.getdetailperson(id: id);
    if(result.errormessage==null){
      emit(DetailSuccesStates(person: result.model??DetailResponse()));

    }else{
      emit(DetailErrorStates());
    }   
  }
}
abstract class DetailStates{}

class DetailLoadingStates extends DetailStates{}

class DetailInitialStates extends DetailStates{}

class DetailSuccesStates extends DetailStates{
  DetailSuccesStates({required this.person});
  final DetailResponse person;
}

class DetailErrorStates extends DetailStates{}