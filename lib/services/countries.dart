import 'package:flutter/cupertino.dart';
import 'package:flutterworldtime/services/world_time.dart';

class CountriesHelper{
  static List<WorldTime> locations;

  static void updateTime(index, context) async{
    await locations[index].getWorldTime();

    Navigator.pop(context, {
      'time' : locations[index].time,
      'location' : locations[index].location,
      'flag' : locations[index].flag,
      'isDayTime' : locations[index].isDayTime
    });
  }
}