import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String time;
  String flag;
  String url;
  String location;
  bool isDayTime;

  WorldTime({this.flag, this.location, this.url});

  Future<void> getWorldTime() async{
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');

      if(response.statusCode == 200)
      {
        Map data = jsonDecode(response.body);

        int offset = int.parse(data['utc_offset'].toString().substring(1,3));

        DateTime now = DateTime.parse(data['utc_datetime']).add(Duration(hours: offset));

        time = DateFormat.jm().format(now);

        isDayTime = now.hour > 6 && now.hour < 19 ? true : false; 
      }
      else{
        throw Exception('Failed to load');
      }
      

    }
    catch(e){
        time = 'Could not get time: ';
    }

  }
}