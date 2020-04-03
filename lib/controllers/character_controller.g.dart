// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharacterController on _CharacterControllerBase, Store {
  final _$listCharacterAtom =
      Atom(name: '_CharacterControllerBase.listCharacter');

  @override
  ObservableList<Character> get listCharacter {
    _$listCharacterAtom.context.enforceReadPolicy(_$listCharacterAtom);
    _$listCharacterAtom.reportObserved();
    return super.listCharacter;
  }

  @override
  set listCharacter(ObservableList<Character> value) {
    _$listCharacterAtom.context.conditionallyRunInAction(() {
      super.listCharacter = value;
      _$listCharacterAtom.reportChanged();
    }, _$listCharacterAtom, name: '${_$listCharacterAtom.name}_set');
  }

  final _$characterAtom = Atom(name: '_CharacterControllerBase.character');

  @override
  Character get character {
    _$characterAtom.context.enforceReadPolicy(_$characterAtom);
    _$characterAtom.reportObserved();
    return super.character;
  }

  @override
  set character(Character value) {
    _$characterAtom.context.conditionallyRunInAction(() {
      super.character = value;
      _$characterAtom.reportChanged();
    }, _$characterAtom, name: '${_$characterAtom.name}_set');
  }

  final _$listComicsAtom = Atom(name: '_CharacterControllerBase.listComics');

  @override
  ObservableList<Comic> get listComics {
    _$listComicsAtom.context.enforceReadPolicy(_$listComicsAtom);
    _$listComicsAtom.reportObserved();
    return super.listComics;
  }

  @override
  set listComics(ObservableList<Comic> value) {
    _$listComicsAtom.context.conditionallyRunInAction(() {
      super.listComics = value;
      _$listComicsAtom.reportChanged();
    }, _$listComicsAtom, name: '${_$listComicsAtom.name}_set');
  }

  final _$listEventsAtom = Atom(name: '_CharacterControllerBase.listEvents');

  @override
  ObservableList<Event> get listEvents {
    _$listEventsAtom.context.enforceReadPolicy(_$listEventsAtom);
    _$listEventsAtom.reportObserved();
    return super.listEvents;
  }

  @override
  set listEvents(ObservableList<Event> value) {
    _$listEventsAtom.context.conditionallyRunInAction(() {
      super.listEvents = value;
      _$listEventsAtom.reportChanged();
    }, _$listEventsAtom, name: '${_$listEventsAtom.name}_set');
  }

  final _$listSeriesAtom = Atom(name: '_CharacterControllerBase.listSeries');

  @override
  ObservableList<Serie> get listSeries {
    _$listSeriesAtom.context.enforceReadPolicy(_$listSeriesAtom);
    _$listSeriesAtom.reportObserved();
    return super.listSeries;
  }

  @override
  set listSeries(ObservableList<Serie> value) {
    _$listSeriesAtom.context.conditionallyRunInAction(() {
      super.listSeries = value;
      _$listSeriesAtom.reportChanged();
    }, _$listSeriesAtom, name: '${_$listSeriesAtom.name}_set');
  }

  final _$listStoriesAtom = Atom(name: '_CharacterControllerBase.listStories');

  @override
  ObservableList<Storie> get listStories {
    _$listStoriesAtom.context.enforceReadPolicy(_$listStoriesAtom);
    _$listStoriesAtom.reportObserved();
    return super.listStories;
  }

  @override
  set listStories(ObservableList<Storie> value) {
    _$listStoriesAtom.context.conditionallyRunInAction(() {
      super.listStories = value;
      _$listStoriesAtom.reportChanged();
    }, _$listStoriesAtom, name: '${_$listStoriesAtom.name}_set');
  }

  final _$loadCharactersAsyncAction = AsyncAction('loadCharacters');

  @override
  Future loadCharacters(int page, String query) {
    return _$loadCharactersAsyncAction
        .run(() => super.loadCharacters(page, query));
  }

  final _$loadCharacterAsyncAction = AsyncAction('loadCharacter');

  @override
  Future loadCharacter(int idCharacter) {
    return _$loadCharacterAsyncAction
        .run(() => super.loadCharacter(idCharacter));
  }

  final _$loadComicsAsyncAction = AsyncAction('loadComics');

  @override
  Future loadComics(int idCharacter) {
    return _$loadComicsAsyncAction.run(() => super.loadComics(idCharacter));
  }

  final _$loadEventsAsyncAction = AsyncAction('loadEvents');

  @override
  Future loadEvents(int idCharacter) {
    return _$loadEventsAsyncAction.run(() => super.loadEvents(idCharacter));
  }

  final _$loadSeriesAsyncAction = AsyncAction('loadSeries');

  @override
  Future loadSeries(int idCharacter) {
    return _$loadSeriesAsyncAction.run(() => super.loadSeries(idCharacter));
  }

  final _$loadStoriesAsyncAction = AsyncAction('loadStories');

  @override
  Future loadStories(int idCharacter) {
    return _$loadStoriesAsyncAction.run(() => super.loadStories(idCharacter));
  }

  @override
  String toString() {
    final string =
        'listCharacter: ${listCharacter.toString()},character: ${character.toString()},listComics: ${listComics.toString()},listEvents: ${listEvents.toString()},listSeries: ${listSeries.toString()},listStories: ${listStories.toString()}';
    return '{$string}';
  }
}
