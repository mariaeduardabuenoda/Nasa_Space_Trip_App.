import 'package:flutter/material.dart';

class PlanetDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String gravity;

  const PlanetDetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.gravity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF071B36),

      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color(0xFF071B36),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Imagem do planeta
            Image.asset(
              image,
              width: 220,
              height: 220,
            ),

            const SizedBox(height: 20),

            // Nome
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Descrição
            Card(
              color: const Color(0xFF102A4C),
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Gravidade
            Card(
              color: const Color(0xFF102A4C),
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Gravity',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),

                    Text(
                      '$gravity m/s²',
                      style: const TextStyle(
                        color: Color(0xFFFF6B35),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}