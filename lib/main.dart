import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  BMICalculator({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      /*theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: const Color(0xFF141A37),
            secondary: const Color(0xFFEB1555),
          ),
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                  color: Colors
                      .white)), //Use TextTheme for specifying the colors for each portion of text
          scaffoldBackgroundColor: const Color(0xFF141A37))*/
    theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF2D4057),
        scaffoldBackgroundColor: const Color(0xFF2D4057),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF141A37))
    ),

      home: const InputPage(),
    );
  }
}

/*class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: const Center(
        child: Text('Body Text'),
      ),
    *//*  floatingActionButton: Theme(
        data: ThemeData(accentColor: Color(0xFFEB1555)),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      )*//*,
    );
  }
}*/

