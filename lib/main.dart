/* Notes 

import 'package:flutter/material.dart';

//widgets is that user see


//"main" is the entry point of the flutter app, it wont run if we have not this method "main"
void main(){
  runApp(GloubeApp());//method that will be shown
}

class GloubeApp extends StatelessWidget { //extends, sunclass or child class of StatelessWidget calss. this widget class do not have a state
  const GloubeApp({ Key? key }) : super(key: key);

  @override
  //all stateless nust have the buid methode. Is the method called when the widget is row on the screen
  Widget build(BuildContext context ) { //context is where the widget will be created. thanks to "context" we can interact with the parent widget to get the size for example
  //we can add new, for this new stance of the MaterialApp
    return MaterialApp( //MaterialApp is the main container
    //the home will be a center. Center is the conteiner and will center its content
      home: Center(child: Text('Hello kitty')),//most of the widget have a child. thanks to "child" we can tested a widget inside another widget
    );
  }
} */
import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/bmi_screen.dart';
import 'package:globo_fitness/screens/intro_screen.dart';

void main() {
  runApp(GloubeApp());
}

class GloubeApp extends StatelessWidget {
  const GloubeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home is a property of the MaterialApp Widget class
      //the value can be another widget  class
      //key or property : value 
      //home: IntroScreen(),-> WE HIDE THIS BECAUSE WE CAN'T HAVE A HOME AND INITIAL ROUTE
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      //Named Routes, like urls to navigate
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen(),
      },
      //we asign the initial route
      initialRoute: '/',
    );
  }
}
