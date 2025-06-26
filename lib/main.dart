import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nordisk/widgets/health_data_notifier.dart';
import 'package:nordisk/mashscore_app.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

// Adicione seu arquivo firebase_options.dart gerado pelo FlutterFire CLI
// import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => HealthDataNotifier(),
      child: const MashscoreApp(),
    ),
  );
}

