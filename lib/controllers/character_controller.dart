import 'package:heros/models/character_model.dart';
import 'package:heros/models/comic_model.dart';
import 'package:heros/models/event_model.dart';
import 'package:heros/models/serie_model.dart';
import 'package:heros/models/storie_model.dart';
import 'package:heros/repositories/vistoria_repository.dart';
import 'package:mobx/mobx.dart';
part 'character_controller.g.dart';

class CharacterController = _CharacterControllerBase with _$CharacterController;

abstract class _CharacterControllerBase with Store {
  CharacterRepository _characterRepository;

  _CharacterControllerBase() {
    _characterRepository = CharacterRepository();
  }

  @observable
  ObservableList<Character> listCharacter;

  @observable
  Character character;

  @observable
  ObservableList<Comic> listComics;
  @observable
  ObservableList<Event> listEvents;
  @observable
  ObservableList<Serie> listSeries;
  @observable
  ObservableList<Storie> listStories;

  @action
  loadCharacters(int page, String query) async {
    listCharacter = ObservableList<Character>.of(
        await _characterRepository.getAllCharacters(page, query));
  }

  @action
  loadCharacter(int idCharacter) async {
    character = await _characterRepository.getCharacter(idCharacter);
  }

  @action
  loadComics(int idCharacter) async {
    listComics = ObservableList<Comic>.of(
        await _characterRepository.getAllComicsByCharacter(idCharacter));
  }

  @action
  loadEvents(int idCharacter) async {
    listEvents = ObservableList<Event>.of(
        await _characterRepository.getAllEventsByCharacter(idCharacter));
  }

  @action
  loadSeries(int idCharacter) async {
    listSeries = ObservableList<Serie>.of(
        await _characterRepository.getAllSeriesByCharacter(idCharacter));
  }

  @action
  loadStories(int idCharacter) async {
    listStories = ObservableList<Storie>.of(
        await _characterRepository.getAllStoriesByCharacter(idCharacter));
  }
}
