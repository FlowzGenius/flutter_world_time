import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String time = data['time'];

    String location = data['location'];

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';

    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/choose_location');
                      setState(() {
                        data = {
                          'location' : result['location'],
                          'time' : result['time'],
                          'flag' : result['flag'],
                          'isDayTime' : result['isDayTime']
                        };
                      });
                    },
                    icon: Icon(Icons.location_on),
                    label: Text('Edit Location')),
                Text(
                  location,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.blueAccent[100],
                  ),
                ),
                Text(
                  time,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 80.0,
                      color: Colors.grey[900]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
