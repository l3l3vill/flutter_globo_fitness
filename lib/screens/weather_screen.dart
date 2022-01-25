import 'package:flutter/material.dart';
import '../data/http_helper.dart';
import '../shared/menu_bottom.dart';
import '../shared/menu_drawer.dart';

class weatherScreen extends StatefulWidget {
  const weatherScreen({Key? key}) : super(key: key);

  @override
  _weatherScreenState createState() => _weatherScreenState();
}

class _weatherScreenState extends State<weatherScreen> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: getData, 
            child: Text('Get Data')
            ),
            Text(result)
          ],
      ),
    );
  }

  Future getData () async {
    //here we are calling the helper we've created in the data file
    HttpHelper helper = HttpHelper();
    //we use the method async that we have created and we asign the result to the "result" variable
    result = await helper.getWeather('bogota');
    //Now we have the result but we hav't show it yet. to update the UI we ALWAYS use setState method
    setState(() {
      //the set state could be empty. when is empty it will update the UI anywas. 
      //if is not empty and has functions in there, it will change the state of the widget, that means change the UI
    });
  }

}
