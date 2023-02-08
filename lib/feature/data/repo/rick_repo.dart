import 'package:dio/dio.dart';
import 'package:rickandmorty/feature/domain/entity/detail_entity.dart';
import 'package:rickandmorty/feature/domain/entity/episodeentity.dart';
import 'package:rickandmorty/feature/domain/entity/filter_entity.dart';
import 'package:rickandmorty/feature/domain/entity/location_entity.dart';
import 'package:rickandmorty/feature/domain/entity/rickandmorty_entity.dart';
import 'package:rickandmorty/feature/domain/repo/rick_repo.dart';

class RickRepoImpl implements RickRepo {
  RickRepoImpl({required this.dio});
  final Dio dio;
  @override
  Future<RickRepoREsponse<RickResponse>> getAllperson(
      {required FilterEntity filterEntity}) async {
    try {
      final request = await dio.get(
        'api/character',
        queryParameters: {
          'page': filterEntity.currentpage,
          'name': filterEntity.searchtext,
          'status':filterEntity.status,
          'gender':filterEntity.gender
        },
      );
      return RickRepoREsponse(model: RickResponse.fromJson(request.data));
    } catch (e) {
      return RickRepoREsponse(errormessage: 'Произошла ошибка');
    }
  }

  @override
  Future<RickRepoREsponse<DetailResponse>> getdetailperson(
      {required int id}) async {
    try {
      final result = await dio.get('api/character/$id');
      return RickRepoREsponse(model: DetailResponse.fromJson(result.data));
    } catch (e) {
      return RickRepoREsponse(errormessage: 'Произошла ошибка');
    }
  }

  @override
  Future<RickRepoREsponse<LocationResponse>> getAlllocation({required int page}) async {
    try {
      final response = await dio.get('api/location/$page');
      page++;
      return RickRepoREsponse(model: LocationResponse.fromJson(response.data));
    } catch (e) {
      return RickRepoREsponse(errormessage: 'Произошла ошибка');
    }
  }

  @override
  Future<RickRepoREsponse<EpisodeResponse>> getAllepisodes() async{
   try {
      final res = await dio.get('api/episode');
      return RickRepoREsponse(model: EpisodeResponse.fromJson(res.data));
    } catch (e) {
      return RickRepoREsponse(errormessage: 'Произошла ошибка');
    }
  }
}
