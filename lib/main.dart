// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';

// void main() => runApp(MyApp());

// // #docregion MyApp
// class MyApp extends StatelessWidget {
//   // #docregion build
//   @override
//   Widget build(BuildContext context) {
//     final title = 'Paint Code Finder';

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: title,
//       theme: ThemeData(
//         primaryColor: Colors.white,
//       ),
//       home: RandomWords(),
//     );
//   }
//   // #enddocregion build
// }
// // #enddocregion MyApp

// // #docregion RWS-var
// class RandomWordsState extends State<RandomWords> {
//   final TextEditingController editingController = TextEditingController();
//   final _suggestions = <WordPair>[];
//   final Set<WordPair> _saved = <WordPair>{};
//   final _biggerFont = const TextStyle(fontSize: 18.0);
//   // #enddocregion RWS-var

//   var items = List<WordPair>();
//   Icon cusIcon = Icon(Icons.search);
//   Widget cusSearchBar = Text("");

//   // #docregion _buildSuggestions
//   Widget _buildSuggestions() {
//     return ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemBuilder: /*1*/ (context, i) {
//           if (i.isOdd) return Divider(); /*2*/

//           final index = i ~/ 2; /*3*/
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10)); /*4*/
//           }
//           return _buildRow(_suggestions[index]);
//         });
//   }
//   // #enddocregion _buildSuggestions

//   // #docregion _buildRow
//   Widget _buildRow(WordPair pair) {
//     final alreadySaved = _saved.contains(pair);
//     return ListTile(
//         title: Text(pair.asPascalCase,
//         style: _biggerFont,
//       ),
//       trailing: Icon(
//         alreadySaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null,
//       ),
//       onTap: () {
//         setState(() {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }
//   // #enddocregion _buildRow

//   // #docregion RWS-build
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon: Icon(Icons.more_vert),
//             onPressed: () {}),
//         actions: <Widget>[
//           IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
//         ],
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget> [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 onChanged: (value) {
//                   filterSearchResults(value);
//                 },
//                 controller: editingController,
//                 decoration: InputDecoration(
//                     labelText: "Search",
//                     hintText: "Search",
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//               ),
//             ),
//             Expanded(
//               child:  _buildSuggestions()
//               )
//           ])));
//   }

//   void filterSearchResults(String query) {
//     List<WordPair> dummySearchList = List<WordPair>();
//     dummySearchList.addAll(_suggestions);
//     if(query.isNotEmpty) {
//       List<WordPair> dummyListData = List<WordPair>();
//       dummySearchList.forEach((element) {
//         if(element.asString.contains(query)) {
//           dummyListData.add(element);
//         }
//       });
//       setState(() {
//         items.clear();
//         items.addAll(dummyListData);
//       });
//       return;
//     } else {
//       setState(() {
//         items.clear();
//         items.addAll(_suggestions);
//       });
//     }
//   }

//   // #enddocregion RWS-build
//   // #docregion RWS-var
//   void _pushSaved() {
//     Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) {
//           final Iterable<ListTile> tiles = _saved.map(
//             (WordPair pair) {
//               return ListTile(
//                 title: Text(
//                   pair.asPascalCase,
//                   style: _biggerFont,
//                 ),
//               );
//             },
//           );
//           final List<Widget> divided = ListTile.divideTiles(
//             context: context,
//             tiles: tiles,
//           ).toList();
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Saved Suggestions'),
//             ),
//             body: ListView(
//               children: divided),
//           );
//         },
//       ),
//     );
//   }
// }
// // #enddocregion RWS-var

// class RandomWords extends StatefulWidget {
//   @override
//   RandomWordsState createState() => RandomWordsState();
// }

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    final title = 'Paint Code Finder';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SearchListExample(),
    );
  }
}

class SearchListExample extends StatefulWidget {
  @override
  _SearchListExampleState createState() => _SearchListExampleState();
}

class _SearchListExampleState extends State<SearchListExample> {
  Widget appBarTitle = Text(
    'Paint Code Finder',
    style: TextStyle(color: Colors.grey),
  );
  Icon icon = Icon(
    Icons.search,
    color: Colors.grey,
  );
  final globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  String _searchText = "";
  List searchresult = List();

  final Set<String> _saved = <String>{};

  _SearchListExampleState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    values();
  }

  void values() {
    _list = List();
    _list.add("Indian rupee");
    _list.add("United States dollar");
    _list.add("Australian dollar");
    _list.add("Euro");
    _list.add("British pound");
    _list.add("Yemeni rial");
    _list.add("Japanese yen");
    _list.add("Hong Kong dollar");
    _list.add("Indian rupesse");
    _list.add("United Statssses dollar");
    _list.add("Australian sssdollar");
    _list.add("Eursso");
    _list.add("ss pound");
    _list.add("Yemessni rial");
    _list.add("Japanssese yen");
    _list.add("Hong Ksssong dollar");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        appBar: buildAppBar(context),
        body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
              Flexible(
                  child: searchresult.length != 0 || _controller.text.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchresult.length,
                          itemBuilder: (BuildContext context, int index) {
                            String listData = searchresult[index];
                            return _buildRow(listData);
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _list.length,
                          itemBuilder: (BuildContext context, int index) {
                            String listData = _list[index];
                            return _buildRow(listData);
                          }))
            ])));
  }

  Widget _buildRow(String text) {
    final alreadySaved = _saved.contains(text);
    return ListTile(
      leading: Chip(
        elevation: 5.0,
        padding: const EdgeInsets.only(left :20, right : 20),
          shape: 
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)),
        label: Text(" "),
        backgroundColor: Colors.green.shade100),
      
      title: Text(
        text.toString(),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(text);
          } else {
            _saved.add(text);
          }
        });
      },
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(centerTitle: true, title: appBarTitle, 
    leading: IconButton(icon: Icon(Icons.more_vert),
      // alignment: Alignment.topLeft,
      onPressed: (){}),
    actions: <Widget>[
      IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
            if (this.icon.icon == Icons.search) {
              this.icon = Icon(
                Icons.close,
                color: Colors.grey,
              );
              this.appBarTitle = TextField(
                controller: _controller,
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey)),
                onChanged: searchOperation,
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
      IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = Icon(
        Icons.search,
        color: Colors.grey,
      );
      this.appBarTitle = Text(
        "Code Finder",
        style: TextStyle(color: Colors.grey),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (String text) {
              return ListTile(
                title: Text(text),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
