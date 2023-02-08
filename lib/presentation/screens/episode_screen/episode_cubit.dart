import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/domain/entity/episodeentity.dart';
import '../../../feature/domain/repo/rick_repo.dart';

class EpisodeCubit extends Cubit<EpisodeStates> {
  EpisodeCubit({required this.repo}) : super(EpisodeInitialStates());
  final RickRepo repo;
  Future<void> getepisodes() async {
    emit(EpisodeLoadingStates());
    final epis = await repo.getAllepisodes();
    if (epis.errormessage == null) {
      emit(EpisodeSuccesStates(results: epis.model?.results ?? []));
    }
    {
      emit(EpisodeErrorStates(errortext: epis.errormessage ?? ''));
    }
  }
}

abstract class EpisodeStates {}

class EpisodeLoadingStates extends EpisodeStates {}

class EpisodeInitialStates extends EpisodeStates {}

class EpisodeSuccesStates extends EpisodeStates {
  final List<Results> results;
  EpisodeSuccesStates({
    required this.results,
  });
}

class EpisodeErrorStates extends EpisodeStates {
  EpisodeErrorStates({required this.errortext});
  final String errortext;
}
