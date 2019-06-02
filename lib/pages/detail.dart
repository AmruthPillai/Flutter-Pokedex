import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailPage({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(pokemon.name),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 40.0,
            top: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width - 80.0,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(pokemon.name),
                  Text('Height: ${pokemon.height}'),
                  Text('Weight: ${pokemon.weight}'),
                  Text('Types'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => FilterChip(
                              backgroundColor: Colors.amber,
                              label: Text(t),
                              onSelected: (bool value) {},
                            ))
                        .toList(),
                  ),
                  Text('Weaknesses'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((t) => FilterChip(
                              backgroundColor: Colors.red,
                              label: Text(
                                t,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onSelected: (bool value) {},
                            ))
                        .toList(),
                  ),
                  Text('Next Evolution'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution
                        .map((n) => FilterChip(
                              backgroundColor: Colors.green,
                              label: Text(n.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onSelected: (bool value) {},
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
