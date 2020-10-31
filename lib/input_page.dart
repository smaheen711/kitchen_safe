import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'user.dart';

const activeCardColour = Color(0xFF1D1E33);
bool temp = false;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final database_ref = FirebaseDatabase.instance.reference().child("1");
  int fire_alert = 0;
  int gas_alert = 0;
  int motion_alert = 0;
  int water_alert = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen'),
      ),
      body: StreamBuilder(
        stream: database_ref.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data.snapshot.value != null) {
            print("snapshot data: ${snapshot.data.snapshot.value.toString()}");

            var _user = USER.fromJson(snapshot.data.snapshot.value);
            fire_alert = _user.fire_alert;
            gas_alert = _user.gas_alert;
            motion_alert = _user.motion_alert;
            water_alert = _user.water_alert;
            print(
                "User: ${_user.fire_alert} / ${_user.gas_alert} / ${_user.motion_alert} / ${_user.water_alert} ");
          } else {}
          return Column(
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
                            color: fire_alert < 2 ? Colors.white : Colors.red,
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
                            color: water_alert < 2 ? Colors.white : Colors.red,
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
                ),
              ),
              Expanded(
                  child: SystemCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      /*file*/
                      children: <Widget>[
                        Expanded(
                          child: SystemCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  color: (water_alert |
                                              gas_alert |
                                              motion_alert |
                                              fire_alert) <
                                          2
                                      ? Colors.green
                                      : Colors.red,
                                  child: Text(
                                    'Fire Brigade',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    turn_off();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SystemCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  color: (water_alert |
                                  gas_alert |
                                  motion_alert |
                                  fire_alert) <
                                      2
                                      ? Colors.green
                                      : Colors.red,
                                  child: Text(
                                    'P.C.R',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    turn_off();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    RaisedButton(
                      color: Colors.indigo,
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
                            color: gas_alert < 2 ? Colors.white : Colors.red,
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
                            color: motion_alert < 2 ? Colors.white : Colors.red,
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void turn_off() {
    database_ref.update({
      'fire_alert': 1,
      'water_alert': 1,
      'gas_alert': 1,
      'motion_alert': 1,
    });
    print('value changed');
  }

  void turn_on() {
    database_ref.update({
      'fire_alert': 2,
      'water_alert': 2,
      'gas_alert': 2,
      'motion_alert': 2,
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
