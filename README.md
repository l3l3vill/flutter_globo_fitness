# globo_fitness

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

STATEFULLWIDGET

ToggleButtons(
    children:[ //-> The list of widgets fo user choises
        Icon(Icons.home),
        Icon(Icons.details),
    ],
    isSelected : isSelected, //-> listo of booleans specifying the selected items. same number of items 
    onPressed:(){//add code here }// react. here we have the index of the pressed widget
),

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: HelloYou(),
        ),
      ),
    );
  }
}

//we create statefulWidget
class HelloYou extends StatefulWidget{
  //inside the widget, we instatiate and asigne the state. we make it private with "_"
  @override
  _HelloYouState createState() => _HelloYouState();
}

//here we create the state. is n extention of the state of the HelloYou widget
class _HelloYouState extends State<HelloYou>{
  //here are the properties that could change. this will be the information of the text under the button
  String name ='';
  //we add the edit text. we make it final because teh source wont change (?)
  final TextEditingController txtName = TextEditingController();
  //then here inside we create the Widget with build
  Widget build(BuildContext context){
    return Column(
      children : [
        //inside the textField- we add the controller as the editer controller
        TextField(
          controller : txtName,
        ),
        ElevatedButton(
          child: Text('Say Hello'),
          onPressed: (){
            //HERE IS THE PART WHERE STATE CHANGES
            //when we click the button, we want to change the text under the bottom with the information taken from the editText
            setState( (){
              name = txtName.text;
            });
          }
        ),
        Text('Hello ' + name ),
      ],
    );
  }
  
}
