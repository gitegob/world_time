import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTimeInstance =
        WorldTime(location: 'Kigali', flag: 'rwanda.png', url: 'Africa/Kigali');
    await worldTimeInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTimeInstance.location,
      'time': worldTimeInstance.time,
      'flag': worldTimeInstance.flag,
      'isDaytime': worldTimeInstance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitThreeBounce(
        color: Colors.white,
        size: 50.0,
      ),
    ));
  }
}
