import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

//We are going to transform this stateless widget, into a statefullwidget because ther are going to be interactions and calculations than i'll make the widget change
//StateLess, we commented only to see how it was before
/* class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      bottomNavigationBar: MenuBottom(),
      drawer: MenuDrawer(),
      body: Center(child: FlutterLogo()),
    );
  }
} */

//Statefull
//1. StatefulWidget class
class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);
  //2. Call State class inside createState method
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

//3. State Class
class _BmiScreenState extends State<BmiScreen> {
  //3.1 declare the statevariables according to the elements that will change in the UI
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double?
      heigth; //as we don't know yet this values, are null. but with flutter we can't let them null, so we add a questionmark
  double?
      weigth; //variables can not be asigned to null values, thats why the question mark
  //list of booleans for the toggleButtons. we initialise "late" for void asign null to this variable and because I know I'll initialiaset it later. I'll initialise it before using.if don't it will crash :P
  late List<bool> isSelected;
  //styling
  final double fontZise = 18;
  //The edit text needs an editing controller, we create the variable here and we use it when we add the TextField under the toggle inside the column list of widgets
  final TextEditingController txtHeigth = TextEditingController();
  final TextEditingController txtWeigth = TextEditingController();
  //hint text that will indicate to the user what to type in the textfield
  String heigthMessage = '';
  String weigthMessage = '';

  //Here we initialise the isSelected. we initialise here thanks to statefull have livecycles
  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  //3.2 Implement the build method
  Widget build(BuildContext context) {
    //we concatetate depending on the selection. to know we do a simplify if: if isMetric = true, then 'meters' else 'inches'
    heigthMessage =
        'Please insert your heigth in ' + ((isMetric) ? 'meters' : 'inches');
    weigthMessage =
        'Please insert your weigth in ' + ((isImperial) ? 'kilos' : 'pounds');
    //3.3 build the UI
    return Scaffold(
        appBar: AppBar(title: Text('BMI Calculator')),
        bottomNavigationBar: MenuBottom(),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //toogle for small number
              ToggleButtons(children: [
                //first element of toogle
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Metric', style: TextStyle(fontSize: fontZise)),
                ),
                //Second element of toogle
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Imperial', style: TextStyle(fontSize: fontZise)),
                ),
              ], isSelected: isSelected, onPressed: toggleMeasure),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                    controller: txtHeigth,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: heigthMessage)),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                    controller: txtWeigth,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: weigthMessage)),
              ),
              ElevatedButton(
                  onPressed: findBMI,
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: fontZise),
                  )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  result,
                  style: TextStyle(fontSize: fontZise),
                ),
              )
            ],
          ),
        ));
  }

  void toggleMeasure(value) {
    //Here we implement the code for reacting au click for the selected metric
    if (value == 0) {
      //that means if user press the first button
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    //Update the UI:until here we have the logic that cahnges but we are displaying nothing. so for make the changes in the UI we need setState
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    //we will take the string from the text that user types. so to parse we use double.tryParse(myVariable). if it returns a number, is ok, if don't it will return null, so for avoid that we add double question mark and 0, to be 0 in case of null
    double height = double.tryParse(txtHeigth.text) ?? 0;
    double weight = double.tryParse(txtWeigth.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = 'your BMI is ' + bmi.toStringAsFixed(2) + '\n you are FAT';
    });
  }
}
