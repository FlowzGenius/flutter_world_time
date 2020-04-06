import 'package:flutter/material.dart';
import 'package:flutterworldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';

  void setUpWorldTime() async{
    WorldTime worldTime = WorldTime(location: 'Joburg', flag: 'SA', url: 'Africa/Johannesburg');

    await worldTime.getWorldTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : worldTime.location,
      'time' : worldTime.time,
      'flag' : worldTime.flag,
      'isDayTime' : worldTime.isDayTime
    });
  }


  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[600],
        child : SpinKitFadingCircle(
          color: Colors.grey[800],
          size: 50.0,
        )
    );
  }
}
