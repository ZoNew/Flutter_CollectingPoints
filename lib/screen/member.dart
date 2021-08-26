import 'package:collecting_points/model/organization.dart';
import 'package:flutter/material.dart';
import 'package:collecting_points/screen/detail_member.dart';
import 'package:http/http.dart' as http;

import 'add_member.dart';


class MembersScreen extends StatefulWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  late List<Organization> _dataFromAPI;

  @override
  void initState() {
    super.initState();
    getOrganization();
  }

  Future<List<Organization>> getOrganization() async {
    var url = Uri.parse("http://192.168.1.2:3000/organizations");
    var response = await http.get(url);
    _dataFromAPI = organizationFromJson(response.body);
    return _dataFromAPI;
  }

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
      body: body(),
    );
  }

  Widget body() {
    return FutureBuilder(
      future: getOrganization(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // ดึงข้อมูลจาก URL มาครบเรียบร้อยจะให้ทำอะไร
        if (snapshot.connectionState == ConnectionState.done) {
          var result = snapshot.data;
          return ListView.builder(
            itemCount: _dataFromAPI.length,
            itemBuilder: (context, index) {
              Member objData = result[0].memberId[index];
              return buildCard(index, context, objData);
            },
          );
        }
        return LinearProgressIndicator(); // Loading...
      },
    );
  }

  Card buildCard(int index, BuildContext context, Member member) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        title: Text(member.tel.toString()),
        subtitle: Text(member.usrName.toString()),
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
