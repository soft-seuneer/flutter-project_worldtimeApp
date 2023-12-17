import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String? time;
  String? flag;
  String? url;
  bool? isDaytime;

  WorldTime({required this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //make the Request
      Response response = await get(Uri.parse(
          'https://timezone.abstractapi.com/v1/current_time/?api_key=45080219a80741a69c472f800016c11b&location=$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      // print(data['timezone_location']);

      //get properties from data
      String datetime = data['datetime'];
      int offset = data['gmt_offset'];
      // print(datetime);
      // print(offset);
      DateTime now = DateTime.parse(datetime);
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
