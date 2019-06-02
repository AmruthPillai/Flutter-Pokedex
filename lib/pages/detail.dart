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
            top: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width - 80.0,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 8.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Height: ${pokemon.height}'),
                  Text('Weight: ${pokemon.weight}'),
                  Text('Avg. Spawns: ${pokemon.avgSpawns}'),
                  Text(
                    'Types',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  Text(
                    'Weaknesses',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  Text(
                    'Next Evolution',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map((n) => FilterChip(
                                  backgroundColor: Colors.green,
                                  label: Text(n.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  onSelected: (bool value) {},
                                ))
                            .toList()
                        : <Widget>[
                            Text(
                              '${pokemon.name} is the last state of evolution.',
                            )
                          ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.id,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30.0),
                  Container(
                    width: 180.0,
                    height: 180.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(pokemon.img),
                      ),
                    ),
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
