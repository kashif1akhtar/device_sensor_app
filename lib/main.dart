import 'package:device_sensor_app/models/device_info_model.dart';
import 'package:device_sensor_app/screens/dashboard_screen.dart';
import 'package:device_sensor_app/screens/sensor_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DeviceInfoModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Device & Sensor App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DashboardScreen(),
      routes: {
        '/sensor': (context) => const SensorScreen(),
      },
    );
  }
}
