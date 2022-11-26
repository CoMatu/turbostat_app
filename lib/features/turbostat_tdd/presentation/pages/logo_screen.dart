import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoScreen extends StatefulWidget {
  @override
  LogoScreenState createState() {
    return LogoScreenState();
  }
}

class LogoScreenState extends State<LogoScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  // late Map<Permission, PermissionStatus> permissions;
  late SharedPreferences prefs;
  late String dataSource;

  void getPermission() async {
    // permissions = await [
    //   Permission.camera,
    //   Permission.storage,
    // ].request();
  }

  void getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    dataSource = prefs.getString('data_source') ?? '';
//    prefs.clear(); // для тестирования разных режимов входа
  }

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    switch (dataSource) {
      case 'device':
        Navigator.of(context).pushReplacementNamed('load_data_page');
        break;
      case 'cloud':
        Navigator.of(context).pushReplacementNamed('start_page');
        break;
      default:
        Navigator.of(context).pushReplacementNamed('select_page');
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 200.0).animate(animationController)
      ..addListener(() => this.setState(() {}))
      ..addStatusListener((AnimationStatus status) {});
    animationController.forward();

    getPermission();

    getSharedPreferences();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var logo = AssetImage('res/images/start_logo.png');
    return Scaffold(
        body: Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: Image(image: logo),
      ),
    ));
  }
}
