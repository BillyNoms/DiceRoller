import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
              'Dice Roller',
                style: TextStyle(
                    fontFamily: 'Bloomberg',
                    fontSize: 20
                ),),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left=1,right=1,count=0;


  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Roll the dice',
            style: TextStyle(
                fontFamily: 'Bloomberg',
                fontSize: 50
            ),
          ),
          Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed:(){
                      count++;
                      setState(() {
                        Change_Value();
                      });
                    },
                    child: Image.asset('images/dice$left.png')),
              )),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed:(){
                      count++;
                      setState(() {
                        Change_Value();
                      });
                    },
                    child: Image.asset('images/dice$right.png')),
              )),
            ],
          ),
          Text(
            'You rolled: ${left+right}',
            style: const TextStyle(
                fontFamily: 'Bloomberg',
                fontSize: 50
            ),
          ),
          Text(
            'Total number of rolls: $count',
            style: const TextStyle(
                fontFamily: 'Bloomberg',
                fontSize: 30
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                left=1;
                right=1;
                count=0;
              });
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.red.withOpacity(0.8);
                  }
                  return Colors.transparent;
                },
              ),
            ),
            child: const Text('Click to reset'),
          ),
        ],
      ),
    );
  }
  void Change_Value(){
    right = 1 + Random().nextInt(6);
    left = 1 + Random().nextInt(6);
  }
}


