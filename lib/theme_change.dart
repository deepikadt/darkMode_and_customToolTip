import 'package:flutter/material.dart';

import 'bloc/theme_bloc.dart';

final bloc = ThemeBloc();

class ThemeApp extends StatefulWidget {
  @override
  _ThemeAppState createState() => _ThemeAppState();
}

class _ThemeAppState extends State<ThemeApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: false,
      stream: bloc.darkThemeEnabled,
      builder: (context, snapshot) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
        home: MyPage(snapshot.data),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final bool darkThemeEnabled;

  MyPage(this.darkThemeEnabled);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          Switch(
            value: darkThemeEnabled,
            onChanged: bloc.changeTheme,
            activeColor: Colors.blue,
            inactiveTrackColor: Colors.white54,
            inactiveThumbColor: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Text(
          "Hi !",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
