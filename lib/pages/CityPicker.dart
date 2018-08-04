import 'package:flutter/material.dart';
import 'FlutterWeather.dart';

class CityPicker extends StatefulWidget {
  @override
  _CityPickerState createState() => new _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  final List<String> cities = ['London', 'Canterbury', 'Folkestone', 'Dover'];

  var _nameFieldController = new TextEditingController();
//
//  void updateList() {
//    var newListEntries = [];
//
//    for (var i = 0; i < cities.length; i++) {
//      newListEntries.add(new ListTile(
//        title: new Text(cities[i]),
//        onLongPress: () => 'selected' + cities[i],
//      ));
//    }
//  }

  void _viewCity(String city) {
    if (Navigator.canPop(context)) {}
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'City Picker';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text('${cities[index]}'),
                    leading: const Icon(Icons.add_location),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterWeather())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
