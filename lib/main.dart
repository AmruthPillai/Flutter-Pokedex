import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        accentColor: Colors.amber[700],
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pokedexJSON =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Pokedex pokedex;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    var res = await http.get(_pokedexJSON);
    var decodedJson = jsonDecode(res.body);
    setState(() {
      pokedex = Pokedex.fromJson(decodedJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokédex'),
        centerTitle: true,
      ),
      body: new PokeGrid(pokedex: pokedex),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
    );
  }
}

class PokeGrid extends StatelessWidget {
  const PokeGrid({
    Key key,
    @required this.pokedex,
  }) : super(key: key);

  final Pokedex pokedex;

  @override
  Widget build(BuildContext context) {
    if (pokedex == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        children: pokedex.pokemon
            .map(
              (pkmn) => Padding(
                    padding: EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(pokemon: pkmn),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(image: NetworkImage(pkmn.img)),
                            SizedBox(height: 5.0),
                            Text(
                              pkmn.name,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            )
            .toList(),
      );
    }
  }
}
