import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothScanScreen extends StatefulWidget {
  const BluetoothScanScreen({super.key});

  @override
  State<BluetoothScanScreen> createState() => _BluetoothScanScreenState();
}

class _BluetoothScanScreenState extends State<BluetoothScanScreen> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> scanResults = [];

  void _startScan() {
    setState(() {
      scanResults.clear();
    });
    flutterBlue.startScan(timeout: const Duration(seconds: 4));
    flutterBlue.scanResults.listen((results) {
      setState(() {
        scanResults = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scansione Bluetooth')),
      body: Column(
        children: [
          ElevatedButton(onPressed: _startScan, child: const Text('Scansiona')),
          Expanded(
              child: ListView.builder(
                  itemCount: scanResults.length,
                  itemBuilder: (context, index) {
                    final device = scanResults[index].device;
                    return ListTile(
                      title: Text(device.name.isNotEmpty
                          ? device.name
                          : 'Dispositivo sconosciuto'),
                      subtitle: Text(device.id.toString()),
                    );
                  }))
        ],
      ),
    );
  }
}
