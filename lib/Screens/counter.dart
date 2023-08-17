import 'package:flutter/material.dart';
import 'package:new_app/Screens/shopping-list-2.dart';

//Elevated button style defined here for reuse
final ButtonStyle elevatedButtonsStyle = ElevatedButton.styleFrom(
  side: const BorderSide(
    color: Colors.black,
    width: 2,
  ),
  shadowColor: Colors.lime,
  textStyle: const TextStyle(
    fontSize: 20,
    fontStyle: FontStyle.normal,
  ),
);

class CounterScreen extends StatefulWidget{
  const CounterScreen ({super.key});

  @override
  State<CounterScreen> createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen>{
  int ourCounter = 0;
  FloatingActionButtonLocation floatLocator =
      FloatingActionButtonLocation.centerFloat;

  bool locatorFlag = true;

  void changeFloatLocation()
  {
    if(locatorFlag)
    {
      setState(() {
        floatLocator = FloatingActionButtonLocation.centerDocked;
      });
    }
    else
    {
      setState(() {
        floatLocator = FloatingActionButtonLocation.centerFloat;
      });
    }

    locatorFlag = !locatorFlag;
  }

  @override
  Widget build(BuildContext context){

    final ButtonStyle elevatedButtonsStyle = ElevatedButton.styleFrom(
      side: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
      shadowColor: Colors.red[400],
      textStyle: const TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.normal,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You have counted $ourCounter times'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: changeFloatLocation,
                      style: elevatedButtonsStyle,
                      child: const Text('Boo'),
                    ),
                    const SizedBox(width: 16,),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                        (context)
                        => const ShoppingList(
                          products: [
                            Product(name: 'Eggs'),
                            Product(name: 'Flour'),
                            Product(name: 'Chocolate chips'),
                          ],
                        )));
                      },
                      style: elevatedButtonsStyle,
                      child: const Text('Screen Shift'),
                    )
                  ],
                )
              ],
          ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.purple[400],
        child: Container(height: 60.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState((){
            ourCounter++;
          });
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: floatLocator,
    );
  }
}