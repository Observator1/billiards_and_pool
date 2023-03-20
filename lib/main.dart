import 'package:billiards_and_pool/lineChart.dart';
import 'package:billiards_and_pool/percentageAccuracy.dart';
import 'package:flutter/material.dart';



void main() => runApp(BilliardsAndPool());

class BilliardsAndPool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Billiards And Pool Tracker',
      theme: new ThemeData(
          scaffoldBackgroundColor: const Color(0xFF424242),
          primaryColor: Colors.blueGrey,
      ),
      home: CounterScreenState(),
    );
  }
}



class CounterScreenState extends StatefulWidget {
  @override
  CounterScreen createState() => CounterScreen();
}

class CounterScreen extends State<CounterScreenState> {
  num _shotsMade = 0.0;
  num _misses = 0.0;
  num _totalShots = 0.0;
  num _shotsMadeDivideTotal = 0.0;
  num _percentage = 0.0;
  num truncateToHundredths(num value) => (value * 100).truncate() / 100;
  late String _sPercentage = _percentage.toStringAsFixed(2);

  //num _sPercentage = num.parse(_percentage.toStringAsFixed(1));
  //String _sPercentage = _percentage.toString();



  void _addShotsMade() {
    setState(() {
      _shotsMade++;
    });
  }

  void _subtractShotsMade() {
    setState(() {
      _shotsMade--;
    });
  }

  void _addMisses() {
    setState(() {
      _misses++;
    });
  }

  void _subtractMisses() {
    setState(() {
      _misses--;
    });
  }


  void _result() {

    setState(() {
      _totalShots = _shotsMade + _misses;
      _shotsMadeDivideTotal = _shotsMade / _totalShots;
      _percentage = _shotsMadeDivideTotal * 100;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text("BAP: Billiards And Pool", style: new TextStyle(),)),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              content(),
              SizedBox(height: 100, width: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.remove),
                      onPressed: () {
                        _subtractShotsMade();
                        _result();
                      }),
                  Text("Shots Made :D", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  Text("${_shotsMade}", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  FloatingActionButton(
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.add),
                      onPressed: () {
                        _addShotsMade();
                        _result();
                      }),
                ],
              ),
              SizedBox(height: 20, width: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                      backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.remove),
                      onPressed: () {
                        _subtractMisses();
                        _result();
                      }),
                  Text("Misses :( ", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  Text("${_misses}", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  FloatingActionButton(
                      backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.add),
                      onPressed: () {
                        _addMisses();
                        _result();
                      }),
                ],
              ),
              SizedBox(height: 20, width: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 80,
                      height: 30,
                      child: Text("$_percentage", style: new TextStyle(color: Colors.white, fontSize: 30.0), overflow: TextOverflow.clip,)
                  ),
                  Text("% Accuracy", style: new TextStyle(fontSize: 30.0, color: Colors.white)),

                ],

              ),
              ElevatedButton(
                onPressed: (
                    PercentageAccuracy.add(_percentage),
                    ){},
                child: Text("Save"),
                style: ButtonStyle(backgroundColor:
                  MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.blue;
                }
                return Colors.blueGrey;
              },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      child:LineChartWidget(percentages),
    );
  }
}
