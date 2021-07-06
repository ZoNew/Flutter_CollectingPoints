import 'package:collecting_points/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:collecting_points/screen/detail_member.dart';
import 'package:provider/provider.dart';

import 'register.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สมาชิก"),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: Icon(Icons.person_add),
          )
        ],
      ),
      // body: buildListView(),
      body: Consumer(builder: (context, UserProvider provider, Widget? child){
        return ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildCard(index, context);
          },
        );
      })
    );
  }

  Card buildCard(int index, BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        title: Text("0801111222 #$index"),
        subtitle: Text("นิติ บอย "),
        onTap: () {
          goToDetailMemberScreen(context);
        },
      ),
    );
  }

  void goToDetailMemberScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return DetailMemberScreen();
      }),
    );
  }

  void _pushSaved() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return RegisterScreen();
      }),
    );
  }
}

/*
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(context: context, tiles: tiles).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );*/
