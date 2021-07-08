import 'package:collecting_points/provider/user_provider.dart';
import 'package:collecting_points/screen/home.dart';
import 'package:collecting_points/screen/member.dart';
import 'package:flutter/material.dart';
import 'package:collecting_points/screen/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return UserProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(title: 'หน้าแรก'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context,listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
