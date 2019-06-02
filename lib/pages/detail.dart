import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailPage({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
    );
  }
}
