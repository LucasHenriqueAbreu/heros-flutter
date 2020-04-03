import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:dio/dio.dart';

import 'package:heros/interfaces/character_repository_interface.dart';
import 'package:heros/models/character_model.dart';
import 'package:heros/models/comic_model.dart';
import 'package:heros/models/event_model.dart';
import 'package:heros/models/response_character_models.dart';
import 'package:heros/models/response_comic_model.dart';
import 'package:heros/models/response_events_model.dart';
import 'package:heros/models/response_series_model.dart';
import 'package:heros/models/response_stories_model.dart';
import 'package:heros/models/storie_model.dart';
import 'package:heros/models/serie_model.dart';
import 'package:heros/shared/consts_api.dart';
import 'package:crypto/crypto.dart' as crypto;

class CharacterRepository implements ICharacterRepository {
  final url = ConstsApi.MARVEL_API_URL + "/v1/public/characters";
  final itemsPerPage = 20;

  @override
  Future<List<Character>> getAllCharacters(int page, String query) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateMd5(
            timestamp + ConstsApi.PRIVATE_API_KEY + ConstsApi.PUBLIC_API_KEY)
        .toString();
    try {
      page = page == null ? 0 : page;
      var offset = (page * itemsPerPage);
      Map<String, String> queryParameters = {
        "apikey": ConstsApi.PUBLIC_API_KEY,
        "hash": hash,
        "ts": timestamp,
        "limit": itemsPerPage.toString(),
        "offset": offset.toString()
      };

      if (query.isNotEmpty && query != null) {
        queryParameters['nameStartsWith'] = query;
      }

      final response = await Dio().get(url, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        final jsonValue = jsonDecode(response.toString());
        final object = CharacterDataWrapper.fromJson(jsonValue);
        return object.data.characters;
      } else {
        print("Erro ao carregar lista" + response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }

  @override
  Future<Character> getCharacter(int idCharacter) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateMd5(
            timestamp + ConstsApi.PRIVATE_API_KEY + ConstsApi.PUBLIC_API_KEY)
        .toString();
    Map<String, String> queryParameters = {
      "apikey": ConstsApi.PUBLIC_API_KEY,
      "hash": hash,
      "ts": timestamp,
    };
    try {
      final response = await await Dio().get('${url}/${idCharacter.toString()}',
          queryParameters: queryParameters);
      if (response.statusCode == 200) {
        final jsonValue = jsonDecode(response.toString());
        final object = CharacterDataWrapper.fromJson(jsonValue);
        return object.data.characters[0];
      } else {
        print("Erro ao carregar character" + response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar character" + stacktrace.toString());
      return null;
    }
  }

  @override
  Future<List<Comic>> getAllComicsByCharacter(int idCharacter) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateMd5(
            timestamp + ConstsApi.PRIVATE_API_KEY + ConstsApi.PUBLIC_API_KEY)
        .toString();
    try {
      Map<String, String> queryParameters = {
        "apikey": ConstsApi.PUBLIC_API_KEY,
        "hash": hash,
        "ts": timestamp,
      };

      final response = await Dio().get(
          '${url}/${idCharacter.toString()}/comics',
          queryParameters: queryParameters);
      if (response.statusCode == 200) {
        final jsonValue = jsonDecode(response.toString());
        final object = ComicDataWrapper.fromJson(jsonValue);
        return object.data.comics;
      } else {
        print("Erro ao carregar lista" + response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }

  _generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  @override
  Future<List<Event>> getAllEventsByCharacter(int idCharacter) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateMd5(
            timestamp + ConstsApi.PRIVATE_API_KEY + ConstsApi.PUBLIC_API_KEY)
        .toString();
    try {
      Map<String, String> queryParameters = {
        "apikey": ConstsApi.PUBLIC_API_KEY,
        "hash": hash,
        "ts": timestamp,
      };

      final response = await Dio().get(
          '${url}/${idCharacter.toString()}/events',
          queryParameters: queryParameters);
      if (response.statusCode == 200) {
        final jsonValue = jsonDecode(response.toString());
        final object = EventDataWrapper.fromJson(jsonValue);
        return object.data.events;
      } else {
        print("Erro ao carregar lista" + response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }

  @override
  Future<List<Serie>> getAllSeriesByCharacter(int idCharacter) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateMd5(
            timestamp + ConstsApi.PRIVATE_API_KEY + ConstsApi.PUBLIC_API_KEY)
        .toString();
    try {
      Map<String, String> queryParameters = {
        "apikey": ConstsApi.PUBLIC_API_KEY,
        "hash": hash,
        "ts": timestamp,
      };

      final response = await Dio().get(
          '${url}/${idCharacter.toString()}/series',
          queryParameters: queryParameters);
      if (response.statusCode == 200) {
        final jsonValue = jsonDecode(response.toString());
        final object = SerieDataWrapper.fromJson(jsonValue);
        return object.data.series;
      } else {
        print("Erro ao carregar lista" + response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }

  @override
  Future<List<Storie>> getAllStoriesByCharacter(int idCharacter) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateMd5(
            timestamp + ConstsApi.PRIVATE_API_KEY + ConstsApi.PUBLIC_API_KEY)
        .toString();
    try {
      Map<String, String> queryParameters = {
        "apikey": ConstsApi.PUBLIC_API_KEY,
        "hash": hash,
        "ts": timestamp,
      };

      final response = await Dio().get(
          '${url}/${idCharacter.toString()}/stories',
          queryParameters: queryParameters);
      if (response.statusCode == 200) {
        final jsonValue = jsonDecode(response.toString());
        final object = StorieDataWrapper.fromJson(jsonValue);
        return object.data.stories;
      } else {
        print("Erro ao carregar lista" + response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
