import 'package:flutter/material.dart';
import 'package:space_trip_app/screens/home_screen.dart';
import 'package:space_trip_app/screens/body_screen.dart';
void main() {
  runApp(const SpaceTripApp());
}

class SpaceTripApp extends StatelessWidget {
  const SpaceTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NASA Space Lines',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          body: Column(
            children: [
              const Expanded(child: HomeScreen()),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BodyScreen(),
                    ),
                  );
                },
                child: const Text('ENTER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
