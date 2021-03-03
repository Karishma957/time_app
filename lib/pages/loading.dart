import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'London', url: 'Europe/London');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'bgImage':instance.isDayTime,
      'TimeOfDay':instance.isWhatTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.green[800] : Colors.green[200],
              ),
            );
          },
        ),
      ),
    );
  }
}
