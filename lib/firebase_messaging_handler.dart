import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    log('Mensaje en background: ${message.messageId} - ${message.notification?.title}');
}