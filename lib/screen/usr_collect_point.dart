import 'package:flutter/material.dart';

class UsrCollectPointScreen extends StatefulWidget {
  const UsrCollectPointScreen({Key? key}) : super(key: key);

  @override
  _UsrCollectPointScreenState createState() => _UsrCollectPointScreenState();
}

class _UsrCollectPointScreenState extends State<UsrCollectPointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("แต้มสะสม")),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return buildCard(index, context);
          }),
    );
  }

  Card buildCard(int index, BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: collectPointsView(),
      ),
    );
  }

  Column collectPointsView() {
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Text("เจ๊จอยชานมไข่มุก", style: TextStyle(fontSize: 20))),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text("50", style: TextStyle(fontSize: 30)),
            ),
            Text("point", style: TextStyle(fontSize: 18)),
          ],
        ),
      ],
    );
  }
}
