import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:heros/controllers/character_controller.dart';
import 'package:heros/models/character_model.dart';
import 'package:heros/shared/widgets/images_aux.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CharacterController _characterController;
  @override
  void initState() {
    super.initState();
    _characterController = CharacterController();
    _characterController.loadCharacters(0, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Catálogo marvel'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print('teste'),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Observer(
          builder: (context) {
            final list = _characterController.listCharacter;
            return list != null
                ? ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final character = list[index];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(4.0, 1.0, 4.0, 1.0),
                        child: _createCard(character),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }

  Widget _createCard(Character character) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: character.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            ImageAux(
                url:
                    '${character.thumbnail.path}.${character.thumbnail.extension}'),
            ListTile(
              title: Text(character.name),
              subtitle: Text(
                character.description == null
                    ? 'Não possui descrição'
                    : character.description,
              ),
              trailing: IconButton(
                icon: Icon(Icons.star),
                color: Theme.of(context).primaryColor,
                onPressed: () => print('Teste'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
