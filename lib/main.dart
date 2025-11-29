import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'package:training_schedule_app/providers/preset_provider.dart';
import 'package:training_schedule_app/providers/session_log_provider.dart';
import 'package:training_schedule_app/presentation/screens/home_screen.dart';
import 'package:training_schedule_app/providers/session_state_provider.dart';
import 'package:training_schedule_app/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock app to portrait mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SessionLogProvider()),
        ChangeNotifierProvider(create: (context) => PresetProvider()),
        ChangeNotifierProvider(create: (context) => SessionStateProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightAppTheme,
      darkTheme: darkAppTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
