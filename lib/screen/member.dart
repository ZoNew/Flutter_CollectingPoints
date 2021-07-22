import 'package:collecting_points/model/user.dart';
import 'package:collecting_points/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:collecting_points/screen/detail_member.dart';
import 'package:provider/provider.dart';

import 'add_member.dart';
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
            IconButton(onPressed: _pushSaved, icon: Icon(Icons.person_add))
          ],
        ),
        body: body());
  }

  Widget body() {
    return Consumer(
      builder: (context, UserProvider provider, Widget? child) {
        int countData = provider.users.length;
        if (countData <= 0) {
          return Center(
            child: Text("ไม่มีข้อมูล", style: TextStyle(fontSize: 20)),
          );
        } else {
          return ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (context, index) {
              User data = provider.users[index];
              return buildCard(index, context, data);
            },
          );
        }
      },
    );
  }

  Card buildCard(int index, BuildContext context, User user) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        title: Text(user.tel.toString()),
        subtitle: Text(user.name.toString()),
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
        return AddMemberScreen();
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
