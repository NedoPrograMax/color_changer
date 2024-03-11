import 'package:color_changer/features/color_changer/presentation/screens/color_changer_screen.dart';
import 'package:color_changer/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer().init();
  runApp(const MyApp());
}

///Main app of this project
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      builder: (_, theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Color Changer',
        theme: theme,
        home: const ColorChangerScreen(),
      ),
    );
  }
}
