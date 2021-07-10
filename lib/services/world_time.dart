import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      http.Response response =
          await http.get(Uri.https("worldtimeapi.org", "api/timezone/$url"));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now =
          DateTime.parse(datetime).add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
      isDaytime = (now.hour > 6 && now.hour < 18) ? true : false;
    } catch (e) {
      print("Error Caught: $e");
      time = 'Could not get time.';
    }
  }
}
