import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'welcome to fulter',
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() {
    return new RandomWordsState();
  }

}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup ....'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.menu), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return new ListView.builder(
      itemBuilder: (context,i){
        if(i.isOdd){
          return new Divider();
        }

        final index = i ~/2;

        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved? Icons.favorite:Icons.favorite_border,
        color: alreadySaved? Colors.red: null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }


  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final titles = _saved.map(
                (it){
              return new ListTile(
                title: new Text(
                  it.asPascalCase,
                  style:_biggerFont,
                ),
              );
            },
          );

          final div = ListTile.divideTiles(
            context: context,
            tiles: titles,
          ).toList();


          return new Scaffold(
            appBar: new AppBar(
              title: new Text("saved"),
            ),
            body: new ListView(children: div),
          );
        },
      ),
    );
  }
}