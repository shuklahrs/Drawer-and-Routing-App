import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterdrawer/NewPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new HomePage(),
      theme: new ThemeData(primarySwatch: Colors.green,
      primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[50] : null),
      // routes: <String, WidgetBuilder>{
      //   "/a": (BuildContext context) => new NewPage("New Page"),
      // },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Drawer App', style: new TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: new Container(
        child: new Center(
          child: new Text('Home Page'),
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Maverick Django"),
                accountEmail: new Text("maverickdjango@yahoo.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.green : Colors.white,
                  child: new Text("MD", style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.green : Colors.white,
                  child: new Text("M"),
                ),
              ],
            ),
            new ListTile(
              title: new Text("Page One"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new NewPage("Page One")));
                },
            ),
            new ListTile(
              title: new Text("Page Two"),
              trailing: new Icon(Icons.arrow_downward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new NewPage("Page Two")));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
