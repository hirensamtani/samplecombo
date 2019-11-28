import 'package:flutter/material.dart';
import 'package:samplecombo/ui/customentry/tabnormal.dart';
import 'package:samplecombo/ui/menu/mainmenu.dart';

class CustomEntryForm extends StatefulWidget {
  @override
  _CustomEntryFormState createState() => _CustomEntryFormState();
}

class _CustomEntryFormState extends State<CustomEntryForm> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController (
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Normal"),
              Tab(text: "Others"),
              //Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
          title: new Text("Custom Entry Form"),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.settings), onPressed: () {
            })
          ],
        ),
        drawer: new MainMenu(),
        body: TabBarView(
          children: [
            new TabNormal(),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );

  }
}
