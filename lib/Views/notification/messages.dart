import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  Map decodedPayload = {};

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
//terminated
    if (data is RemoteMessage) {
      decodedPayload = data.data;
    }

    //foreground
    void processData(dynamic data) {
      String? payload = data['payload'];
      if (payload != null) {
        var decodedPayload = jsonDecode(payload);
        print("Decoded payload data: $decodedPayload");
      } else {
        print("No payload found.");
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your Message"),
      ),
      body: Center(
        child: Text(decodedPayload.toString()),
      ),
    );
  }
}
