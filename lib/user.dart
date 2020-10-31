class USER {
  final int fire_alert;
  final int gas_alert;
  final int motion_alert;
  final int water_alert;

  USER({this.fire_alert, this.gas_alert, this.motion_alert, this.water_alert});

  factory USER.fromJson(Map <dynamic, dynamic> json){
    int parser(dynamic source) {
      try {
        return int.parse(source.toString());
      } on FormatException {}
      return -1;
    }
    return USER(
        fire_alert: parser(json['fire_alert']),
        gas_alert: parser(json['gas_alert']),
        motion_alert: parser(json['motion_alert']),
        water_alert: parser(json['water_alert'])
    );
  }


}