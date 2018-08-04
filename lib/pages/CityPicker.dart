import 'package:flutter/material.dart';

class CityPicker extends StatefulWidget {
  @override
  _CityPickerState createState() => new _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  List listEntries = [];

  var cities = ['London', 'Canterbury', 'Folkestone', 'Dover'];

  var _nameFieldController = new TextEditingController();

  void updateList() {
    var newListEntries = [];

    for (var i = 0; i < cities.length; i++) {
      newListEntries.add(new ListTile(
        title: new Text(cities[i]),
        onLongPress: () => 'selected' + cities[i],
      ));
    }

    setState(() {
      listEntries = newListEntries;
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('City List',
            style: new TextStyle(
                color: Colors.white, fontWeight: FontWeight.w100)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: new ListView(children: <Widget>[
        new ListTile(
          title: new TextField(
            controller: _nameFieldController,
            decoration: new InputDecoration(
              labelText: 'Enter City Name',
            ),
          ),
        ),
        new ListTile(
          title: new RaisedButton(
            child: new Text('Submit'),
            onPressed: () => updateList(),
          ),
        ),
      ]),
    );
  }
}
