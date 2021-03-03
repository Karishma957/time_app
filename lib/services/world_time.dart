import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String location;
  String time;
  String url;
  String isDayTime;
  String isWhatTime;

  WorldTime({this.location,this.url});

  Future<void> getTime() async {

    try{
      Response response =
      await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4, 6);
      DateTime now = DateTime.parse(datetime);
      now = now
          .add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

      time=DateFormat.jm().format(now);
      if((now.hour>6)&&(now.hour)<17){
        isDayTime='assets/images/daysky.jpg';
        isWhatTime='day';
      }
      else if(now.hour>=17 && now.hour<20){
        isDayTime='assets/images/eveningsky.jpg';
        isWhatTime='evening';
      }
      else{
        isDayTime='assets/images/Nightsky.jpg';
        isWhatTime='night';
      }
    }
    catch(e){
      print('caught error: $e');
      time='error';
    }


  }
}