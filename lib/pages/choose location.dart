import 'package:flutter/material.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London'),
    WorldTime(url: 'Europe/Athens', location: 'Athens'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi'),
    WorldTime(url: 'America/Chicago', location: 'Chicago'),
    WorldTime(url: 'America/New_York', location: 'New York'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'bgImage': instance.isDayTime,
      'TimeOfDay': instance.isWhatTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('run');
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 10,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Card(
              color: Colors.pink[10],
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
              ),
            ),
          );
        },
      ),
    );
  }
}
