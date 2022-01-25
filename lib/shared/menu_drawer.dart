import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/weather_screen.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: buildMenuItems(context)),
    );
  }

  //method that returns a list and build the items of the menu
  List<Widget> buildMenuItems(BuildContext context) {
    //List of menu titles. final because we are not going to modify this list
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training'
    ];
    //List of widgets of the menu. the items. is not final because after we are going to add items
    List<Widget> menuItems = [];
    //here we add items, first the Drawer...
    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Text(
        'Globo Fitness',
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    ));
    //and then the list of tittles we have created with menuTitles list
    menuTitles.forEach((String element) {
      //we create the variable widget screen for each title that represents each screen
      Widget screen = Container();
      //we add to the list of items, the tittles
      menuItems.add(ListTile(
        title: Text(element, style: TextStyle(fontSize: 18)),
        //here we will have the code that responds the click
        //when click, it will detcects what was clicked to can go to that specific screen
        onTap: () {
          switch (element) {
            case 'Home':
              screen = IntroScreen();
              break;
            case 'BMI Calculator':
              screen = BmiScreen();
              break;
            case 'Weather':
              screen = weatherScreen();
              break;
          }
          //to remove the drawer from the stack (the stack of screens), we use pop. in that way we only activated when click the burger button and not whe we go back
          Navigator.of(context).pop();
          //Unamed routes
          //once we know hat is the selected screen thanks to the switch, we ause the navigator to push to the route of that screen
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}
