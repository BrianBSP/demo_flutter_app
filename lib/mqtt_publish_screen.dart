import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttPublishScreen extends StatefulWidget {
  const MqttPublishScreen({super.key});

  @override
  State<MqttPublishScreen> createState() => _MqttPublishScreenState();
}

class _MqttPublishScreenState extends State<MqttPublishScreen> {
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final String broker = 'test.mosquitto.org';
  final int port = 1883;
  MqttServerClient? client;

  void _publishMessage() async {
    client = MqttServerClient(
        broker, 'flutter_client_${DateTime.now().millisecondsSinceEpoch}');
    client!.port = port;
    client!.setProtocolV311();
    client!.logging(on: false);
    try {
      client!.connectionMessage = MqttConnectMessage()
          .withClientIdentifier(
              'flutter_client_${DateTime.now().millisecondsSinceEpoch}')
          .startClean();
      ;
      await client!.connect();
      final builder = MqttClientPayloadBuilder();
      builder.addString(_messageController.text);
      client!.publishMessage(
          _topicController.text, MqttQos.atMostOnce, builder.payload!);
      client!.disconnect();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Connessione fallita')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pubblicazione MQTT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _topicController,
              decoration: const InputDecoration(labelText: 'Topic'),
            ),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(labelText: 'Messaggio'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _publishMessage,
              child: const Text('Invio'),
            ),
          ],
        ),
      ),
    );
  }
}
