import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

const activeCardColour = Color(0xFF1D1E33);
bool temp = false;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final database_ref = FirebaseDatabase.instance.reference();

  /*onSwitchValue(newVal){
    setState(() {
      temp = newVal;
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: SystemCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.fire,
                      color: Colors.white,
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Fire Alert',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: SystemCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.water,
                      color: Colors.white,
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Water Alert',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          )),
          Expanded(
              child: SystemCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'Turn On',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    turn_on();
                  },
                ),
                RaisedButton(
                  child: Text(
                    'Turn Off',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    turn_off();
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '                     Device Controller                             ',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF8D8E98),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: SystemCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.cloudversify,
                      color: Colors.white,
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Gas Alert',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: SystemCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.bolt,
                      color: Colors.white,
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Motion Alert',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          )),
        ],
      ),
    );
  }

  void turn_off() {
    database_ref.child("1").update({
      'fire_alert': false,
      'water_alert': false,
      'gas_alert': false,
      'motion_alert': false
    });
    print('value changed');
  }

  void turn_on() {
    database_ref.child("1").update({
      'fire_alert': true,
      'water_alert': true,
      'gas_alert': true,
      'motion_alert': true,
    });
    print('value changed');
  }
}

class SystemCard extends StatelessWidget {
  SystemCard({this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: activeCardColour,
      ),
    );
  }
}
