import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;

    Color bgColor = Colors.black, textColor = Colors.white;

    if (data['TimeOfDay'] == 'day') {
      bgColor = Colors.lightBlueAccent;
      textColor = Colors.black;
    } else if (data['TimeOfDay'] == 'evening') {
      textColor = Colors.purple[800];
      bgColor = Colors.blue[300];
    } else {
      bgColor = Colors.indigo[700];
      textColor = Colors.white;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(data['bgImage']),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:8.0,right:8,bottom:50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only( bottom: 20),
                  child: FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'bgImage': result['bgImage'],
                          'TimeOfDay': result['TimeOfDay']
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'].toUpperCase(),
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 50,
                          letterSpacing: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                      color: textColor,
                      fontSize: 30,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
