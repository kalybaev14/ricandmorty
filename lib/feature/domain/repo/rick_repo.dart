import 'package:rickandmorty/feature/domain/entity/filter_entity.dart';
import 'package:rickandmorty/feature/domain/entity/rickandmorty_entity.dart';

import '../entity/detail_entity.dart';
import '../entity/episodeentity.dart';
import '../entity/location_entity.dart';

abstract class RickRepo {
  Future<RickRepoREsponse<RickResponse>> getAllperson({required FilterEntity filterEntity});
  Future<RickRepoREsponse<DetailResponse>> getdetailperson({required int id});
  Future<RickRepoREsponse<LocationResponse>> getAlllocation({required int page});
  Future<RickRepoREsponse<EpisodeResponse>> getAllepisodes();


}

class RickRepoREsponse<T> {
  final T? model;
  final String? errormessage;
  RickRepoREsponse({
    this.model,
    this.errormessage,
  });
}
