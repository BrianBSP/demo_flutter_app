import 'package:demo_flutter_app/bluetooth_scan_screen.dart';
import 'package:demo_flutter_app/mqtt_subscribe_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'mqtt_publish_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/publish': (context) => const MqttPublishScreen(),
        '/subscribe': (context) => const MqttSubscribeScreen(),
        '/bluetooth': (context) => const BluetoothScanScreen(),
      },
    );
  }
}
