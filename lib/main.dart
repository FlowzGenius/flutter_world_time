import 'package:flutter/material.dart';
import 'package:flutterworldtime/pages/home.dart';
import 'package:flutterworldtime/pages/loading.dart';
import 'package:flutterworldtime/pages/location.dart';
import 'package:flutterworldtime/services/world_time.dart';
import 'package:flutterworldtime/services/countries.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Loading(),
        '/choose_location' : (context) => Location(),
        '/home' : (context) => Home()
      }
  ));

  CountriesHelper.locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Joburg', flag: 'southafrica.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Spain', flag: 'spain.webp')
  ];
}
