import 'package:heros/models/character_model.dart';
import 'package:heros/models/comic_model.dart';
import 'package:heros/models/event_model.dart';
import 'package:heros/models/serie_model.dart';
import 'package:heros/models/storie_model.dart';

abstract class ICharacterRepository {
  Future<List<Character>> getAllCharacters(int page, String query);
  Future<Character> getCharacter(int idCharacter);
  Future<List<Comic>> getAllComicsByCharacter(int idCharacter);
  Future<List<Event>> getAllEventsByCharacter(int idCharacter);
  Future<List<Storie>> getAllStoriesByCharacter(int idCharacter);
  Future<List<Serie>> getAllSeriesByCharacter(int idCharacter);
}
