// ignore: file_names
import 'package:flutter/material.dart';
import 'package:space_trip_app/screens/body_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Plano de fundo
          Image.asset(
            'assets/imagens/background.jpg',
            fit: BoxFit.cover,
          ),

          // Conteúdo
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'NASA',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Space Lines',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BodyScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'ENTER',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}