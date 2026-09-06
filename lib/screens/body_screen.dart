import 'package:flutter/material.dart';
import 'data/planets.dart';
import 'planet_detail_screen.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF071B36),

      appBar: AppBar(
        title: const Text('Choose your destination'),
        backgroundColor: const Color(0xFF071B36),
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),

        itemCount: planets.length,

        itemBuilder: (context, index) {
          final planet = planets[index];

          return Card(
            color: const Color(0xFF102A4C),
            margin: const EdgeInsets.only(bottom: 16),

            child: InkWell(
              borderRadius: BorderRadius.circular(12),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanetDetailScreen(
                      name: planet.name,
                      image: planet.image,
                      description: planet.description,
                      gravity: planet.gravity,
                    ),
                  ),
                );
              },

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Row(
                  children: [

                    Image.asset(
                      planet.image,
                      width: 90,
                      height: 90,
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(
                            planet.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            planet.description,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'Gravity: ${planet.gravity} m/s²',
                            style: const TextStyle(
                              color: Color(0xFFFF6B35),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white54,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}