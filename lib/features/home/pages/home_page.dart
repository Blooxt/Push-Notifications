import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../core/notifications/notification_service.dart';

class HomePage extends StatefulWidget  {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _service = NotificationService();
  String? token;
  
  @override
  void initState() {
    super.initState();
    _getToken();
  }

  Future<void> _getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Turismo + FCM')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _service.showLocal(title: 'Prueba local', body: 'Hola desde flutter 🚀');
              }, child: const Text('Notificacíon local')
            ),
            ElevatedButton(
              onPressed: () {
                _service.showBigPicture(
                  title: 'Nueva promoción 🌴',
                  body: '¡Disfruta 30% en Cancún este fin de semana!',
                  imageUrl: 'https://imgs.search.brave.com/el9Y9V4nXeEOk5q7HSVQYbstdfAS-HSbc-_dj7EzK0Y/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzA0LzYxLzg1LzYw/LzM2MF9GXzQ2MTg1/NjAxMV9RNVp6TnFB/ZTQ5UlBUYnhFT0tN/QmxraVg5bVJVQWpl/cC5qcGc',
                );
              }, child: const Text('Mostart Notificación con imagen'),
            ),
            const SizedBox(height: 20),
            Text('Token FCM: \n${token ?? "Cargando..."}', textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}