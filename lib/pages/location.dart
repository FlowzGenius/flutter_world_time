import 'package:flutter/material.dart';
import 'package:flutterworldtime/services/countries.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) { return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount : CountriesHelper.locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey[700],
                child: ListTile(
                  onTap: () async{
                      CountriesHelper.updateTime(index, context);
                  },
                  title: Text(CountriesHelper.locations[index].location, style: TextStyle(fontWeight: FontWeight.bold),),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${CountriesHelper.locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
