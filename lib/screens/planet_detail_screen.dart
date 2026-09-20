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
  final TextEditingController _weightController = TextEditingController();
  String _weightResult = '';

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

  // FUNÇÃO CALCULAR PESO
  void _calculateWeight() {
    final String text = _weightController.text.replaceAll(',', '.');
    final double? earthWeight = double.tryParse(text);

    if (earthWeight == null || earthWeight <= 0) {
      setState(() {
        _weightResult = 'Enter a valid weight.';
      });
      return;
    }

    final double gravity = double.tryParse(widget.gravity) ?? 9.81;
    const double earthGravity = 9.81;

    final double spaceWeight = (earthWeight * gravity) / earthGravity;

    setState(() {
      _weightResult =
          'On ${widget.name}, you would weigh ${spaceWeight.toStringAsFixed(2)} kg!';
    });
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
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
                  'Return to Earth',
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

              // CARDS DE INFORMAÇÃO
              _infoCard(
                icon: Icons.circle,
                title: 'Destination Status',
                value: _status(),
              ),

              const SizedBox(height: 12),

              _infoCard(
                icon: Icons.location_on,
                title: 'Distance from Earth',
                value: _distance(),
              ),

              const SizedBox(height: 12),

              _infoCard(
                icon: Icons.ac_unit,
                title: 'Current Weather',
                value: _climate(),
              ),

              const SizedBox(height: 12),

              _infoCard(
                icon: Icons.public,
                title: 'Gravity',
                value: '${widget.gravity} m/s²',
              ),

              const SizedBox(height: 30),

              // SEÇÃO NASA APOD (IMAGEM/VÍDEO DO DIA)
              FutureBuilder<Map<String, dynamic>>(
                future: NasaService().getApod(),
                builder: (context, snapshot) {
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

                  if (snapshot.hasError) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF102A4C),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'Unable to load NASA APOD.',
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF102A4C),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'No NASA APOD data available.',
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    );
                  }

                  final apod = snapshot.data!;

                  final String title = apod['title']?.toString() ?? 'NASA APOD';

                  final String imageUrl = apod['url']?.toString() ?? '';

                  final String mediaType =
                      apod['media_type']?.toString() ?? 'image';

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

                        // IMAGEM
                        if (mediaType == 'image' && imageUrl.isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              imageUrl,
                              width: double.infinity,
                              fit: BoxFit.cover,

                              // IMPORTANTE PARA FLUTTER WEB
                              webHtmlElementStrategy:
                                  WebHtmlElementStrategy.prefer,

                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: double.infinity,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF071B36),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Unable to display NASA image.',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        // VÍDEO
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
                                  "Today's NASA APOD",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                const Text(
                                  "Today's astronomical content is a video.",
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
                          )
                        // CASO INESPERADO
                        else
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF071B36),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'NASA content unavailable.',
                              style: TextStyle(color: Colors.white70),
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

              const SizedBox(height: 30),

              // CALCULADORA DE PESO ESPACIAL
              Container(
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
                      'SPACE GRAVITY',
                      style: TextStyle(
                        color: Color(0xFFFF6B35),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Find out how much you would weigh in${widget.name}.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _weightController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Enter your weight in kg on Earth',
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: const Color(0xFF071B36),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(
                          Icons.monitor_weight,
                          color: Color(0xFFFF6B35),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _calculateWeight,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B35),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'CALCULATE SPATIAL WEIGHT',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (_weightResult.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF071B36),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _weightResult,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // COMPONENTE HELPER DOS CARDS DE INFORMAÇÃO
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
