import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothScanScreen extends StatefulWidget {
  const BluetoothScanScreen({super.key});

  @override
  State<BluetoothScanScreen> createState() => _BluetoothScanScreenState();
}

class _BluetoothScanScreenState extends State<BluetoothScanScreen> {
  List<ScanResult> scanResults = [];

  void _startScan() async {
    FlutterBluePlus flutterBlue = FlutterBluePlus();

    // scansiona
    // Start scanning
    /* await flutterBlue.startScan(
        timeout: Duration(seconds: 4), androidUsesFineLocation: true); */

    // risultati scansione
    FlutterBluePlus.scanResults.listen((results) {
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
