class Planet {
  final String name;
  final String image;
  final String description;
  final String gravity;

  Planet({
    required this.name,
    required this.image,
    required this.description,
    required this.gravity,
  });
}

final List<Planet> planets = [
  Planet(
    name: 'Mars',
    image: 'assets/imagens/mars.png',
    description:
        'Mars is known as the Red Planet. It has a thin atmosphere and very low temperatures.',
    gravity: '3.71',
  ),

  Planet(
    name: 'Moon',
    image: 'assets/imagens/moon.png',
    description:
        'The Moon is Earth\'s only natural satellite.',
    gravity: '1.62',
  ),

  Planet(
    name: 'Neptune',
    image: 'assets/imagens/neptune.png',
    description:
        'Neptune is the farthest planet from the Sun.',
    gravity: '11.15',
  ),

  Planet(
    name: 'Saturn',
    image: 'assets/imagens/saturn.png',
    description:
        'Saturn is known for its prominent ring system.',
    gravity: '10.44',
  ),

  Planet(
    name: 'ISS',
    image: 'assets/imagens/iss.png',
    description: 'The International Space Station (ISS) is a Space Station, or a habitable artificial satellite in low Earth orbit.',
    gravity: '0.00',
  ),

  Planet(
    name: 'Sun',
    image: 'assets/imagens/sun.png',
    description: 'The sun is the star at the center of the solar system. It is a nearly perfect sphere of hot plasma, with internal convective motion that generaters a mgnetic field via a dynamo process.',
    gravity: '274.00',
  ),
];