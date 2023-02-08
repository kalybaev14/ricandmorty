import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/domain/entity/location_entity.dart';
import '../../../feature/domain/repo/rick_repo.dart';

class LocationCubit extends Cubit<LocationStates> {
  LocationCubit({required this.repo}) : super(LocationInitialStates());
  final RickRepo repo;
  Future<void> getlocation({required int page}) async {
    emit(LocationLoadingStates());
    final loc = await repo.getAlllocation(page:page );
    if (loc.errormessage == null) {
      emit(LocationSuccesStates(result: loc.model?.locations??[]));
    } else {
      emit(LocationErrorStates(errortext: loc.errormessage??''));
    }
  }
}

abstract class LocationStates {}

class LocationLoadingStates extends LocationStates {}

class LocationInitialStates extends LocationStates {}

class LocationSuccesStates extends LocationStates {
  LocationSuccesStates({required this.result});
  final List<Location> result;
}

class LocationErrorStates extends LocationStates {
  LocationErrorStates({required this.errortext});
  final String errortext;
}
