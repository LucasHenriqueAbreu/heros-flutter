import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:heros/controllers/character_controller.dart';
import 'package:heros/models/character_model.dart';
import 'package:heros/models/comic_model.dart';
import 'package:heros/shared/widgets/images_aux.dart';

import 'cast_card.dart';

class DetailView extends StatefulWidget {
  final int idCharacter;

  const DetailView({Key key, this.idCharacter}) : super(key: key);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  CharacterController _characterController;

  @override
  void initState() {
    super.initState();
    _characterController = CharacterController();
    _characterController.loadCharacter(widget.idCharacter);
    _characterController.loadComics(widget.idCharacter);
    _characterController.loadEvents(widget.idCharacter);
    _characterController.loadSeries(widget.idCharacter);
    _characterController.loadStories(widget.idCharacter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar with floating: false, pinned: true, snap: false:
      body: Observer(
        builder: (context) {
          return _characterController.character != null
              ? NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        expandedHeight: 200.0,
                        floating: false,
                        pinned: true,
                        snap: false,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(
                            _characterController.character.name,
                          ),
                          background: ImageAux(
                              url:
                                  '${_characterController.character.thumbnail.path}.${_characterController.character.thumbnail.extension}'),
                        ),
                      ),
                    ];
                  },
                  body: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text('Description:'),
                        subtitle:
                            Text(_characterController.character.description),
                      ),
                      ListTile(
                        title: Text('Comics:'),
                        subtitle: _criaSection(_characterController.listComics),
                      ),
                      ListTile(
                        title: Text('Events:'),
                        subtitle: _criaSection(_characterController.listEvents),
                      ),
                      ListTile(
                        title: Text('Series:'),
                        subtitle: _criaSection(_characterController.listSeries),
                      ),
                      ListTile(
                        title: Text('Stories:'),
                        subtitle:
                            _criaSection(_characterController.listStories),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget _criaSection(List<dynamic> list) {
    return list != null
        ? Container(
            child: list.length > 0
                ? Container(
                    height: 140.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: list
                          .map(
                            (dynamic item) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CastCard(item.title, item.thumbnail),
                            ),
                          )
                          .toList(),
                    ),
                  )
                : Text('Não possui dados'),
          )
        : Center(child: CircularProgressIndicator());
  }
}
