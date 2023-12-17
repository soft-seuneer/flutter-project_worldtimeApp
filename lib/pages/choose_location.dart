import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Oxford, United Kingdom', location: 'Oxford', flag: 'uk.png'),
    WorldTime(url: 'Athens, Greece', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Cairo, Egypt', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Nairobi, Kenya', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'Chicago, USA', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'New_York, USA', location: 'New York', flag: 'usa.png'),
    WorldTime(
        url: 'Seoul, South_Korea', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        url: 'Jakarta, Indonesia', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Ibadan, Nigeria', location: 'Ibadan', flag: 'nigeria.jpg')
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
