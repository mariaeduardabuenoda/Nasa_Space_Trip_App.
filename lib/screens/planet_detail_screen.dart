import 'package:flutter/material.dart';
import '../services/nasa_service.dart';

class PlanetDetailScreen extends StatefulWidget {
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
  State<PlanetDetailScreen> createState() => _PlanetDetailScreenState();
}

class _PlanetDetailScreenState extends State<PlanetDetailScreen> {
  // STATUS DO DESTINO
  String _status() {
    switch (widget.name) {
      case 'Mars':
        return '🔴 Red planet';

      case 'Moon':
        return '🌑 Earth\'s natural satellite';

      case 'Neptune':
        return '🔵 Ice giant';

      case 'Saturn':
        return '🪐 Ringed planet';

      case 'ISS':
        return '🚀 Space station';

      case 'Sun':
        return '☀️ Star';

      default:
        return 'Space destination';
    }
  }

  // DISTÂNCIA DA TERRA
  String _distance() {
    switch (widget.name) {
      case 'Mars':
        return '225 million km';

      case 'Moon':
        return '384,400 km';

      case 'Neptune':
        return '4.3 billion km';

      case 'Saturn':
        return '1.4 billion km';

      case 'ISS':
        return 'Approximately 400 km';

      case 'Sun':
        return '150 million km';

      default:
        return 'Unknown';
    }
  }

  // CLIMA / CONDIÇÕES
  String _climate() {
    switch (widget.name) {
      case 'Mars':
        return 'Icy and Stormy';

      case 'Moon':
        return 'No atmosphere';

      case 'Neptune':
        return 'Extremely cold and windy';

      case 'Saturn':
        return 'Extremely cold';

      case 'ISS':
        return 'Microgravity environment';

      case 'Sun':
        return 'Extremely hot';

      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF071B36),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BOTÃO VOLTAR
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: const Text(
                  'Voltar para a Terra',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              const SizedBox(height: 20),

              // IMAGEM DO PLANETA
              Center(child: Image.asset(widget.image, width: 220, height: 220)),

              const SizedBox(height: 15),

              // NOME
              Center(
                child: Text(
                  widget.name.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // SUBTÍTULO
              Center(
                child: Text(
                  _status(),
                  style: const TextStyle(
                    color: Color(0xFFFF6B35),
                    fontSize: 14,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // DESCRIÇÃO
              Card(
                color: const Color(0xFF102A4C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Text(
                    widget.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // STATUS
              _infoCard(
                icon: Icons.circle,
                title: 'Destination Status',
                value: _status(),
              ),

              const SizedBox(height: 12),

              // DISTÂNCIA
              _infoCard(
                icon: Icons.location_on,
                title: 'Distance from Earth',
                value: _distance(),
              ),

              const SizedBox(height: 12),

              // CLIMA
              _infoCard(
                icon: Icons.ac_unit,
                title: 'Current Weather',
                value: _climate(),
              ),

              const SizedBox(height: 12),

              // GRAVIDADE
              _infoCard(
                icon: Icons.public,
                title: 'Gravity',
                value: '${widget.gravity} m/s²',
              ),

              const SizedBox(height: 30),

              // NASA APOD
              FutureBuilder<Map<String, dynamic>>(
                future: NasaService().getApod(),

                builder: (context, snapshot) {
                  // CARREGANDO
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: const Color(0xFF102A4C),
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFFF6B35),
                        ),
                      ),
                    );
                  }

                  // ERRO
                  if (snapshot.hasError) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: const Color(0xFF102A4C),
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: const Text(
                        'Não foi possível carregar a imagem da NASA.',
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    );
                  }

                  // DADOS RECEBIDOS
                  final apod = snapshot.data!;

                  final String title = apod['title'] ?? 'NASA APOD';

                  final String imageUrl = apod['url'] ?? '';

                  final String mediaType = apod['media_type'] ?? 'image';

                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: const Color(0xFF102A4C),
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text(
                          'NASA APOD',
                          style: TextStyle(
                            color: Color(0xFFFF6B35),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Astronomical image of the day',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),

                        const SizedBox(height: 20),

                        if (mediaType == 'image' && imageUrl.isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              imageUrl,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        else if (mediaType == 'video')
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF071B36),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.play_circle_outline,
                                  color: Color(0xFFFF6B35),
                                  size: 70,
                                ),
                                const SizedBox(height: 15),
                                const Text(
                                  'NASA APOD de hoje',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'O conteúdo astronômico de hoje é um vídeo.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  imageUrl,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white38,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        const SizedBox(height: 15),

                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // COMPONENTE DOS CARDS DE INFORMAÇÃO
  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xFF102A4C),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFF6B35), size: 28),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),

                const SizedBox(height: 5),

                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
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
