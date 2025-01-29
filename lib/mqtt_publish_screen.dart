import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
