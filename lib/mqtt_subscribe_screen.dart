import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttSubscribeScreen extends StatefulWidget {
  const MqttSubscribeScreen({super.key});

  @override
  State<MqttSubscribeScreen> createState() => _MqttSubscribeScreenState();
}

class _MqttSubscribeScreenState extends State<MqttSubscribeScreen> {
  final TextEditingController _topicController = TextEditingController();
  List<String> messages = [];
  MqttServerClient? client;

  void _subscribe() async {
    client = MqttServerClient('test.mosquitto.org', '');

    await client!.connect();
    client!.subscribe(_topicController.text, MqttQos.atMostOnce);
    client!.updates!.listen((event) {
      setState(() {
        messages.add(event[0].payload.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sottoscrizione MQTT'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _topicController,
              decoration: const InputDecoration(labelText: 'Topic'),
            ),
            ElevatedButton(
              onPressed: _subscribe,
              child: const Text('Sottoscrivi'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(messages[index]),
                ),
              ),
            ),
          ],
        ));
  }
}
