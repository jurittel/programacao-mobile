import 'package:flutter/material.dart';
 
void main() {
  runApp(TravelCatalogApp());
}
 
class TravelCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Viagens',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home: TravelHomePage(),
    );
  }
}
 
class TravelHomePage extends StatelessWidget {
  final List<Destination> featuredDestinations = [
    Destination(
      name: 'Schwangau - Alemanha - Ida e Volta em reais: 4.460,00!',
      imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipNlaRQANcoEyyGsvCFBcBcTC13tLrertKYh4y8j=w608-h351-n-k-no',
    ),
    Destination(
      name: 'Andorra-a-Velha - Andorra - Ida e Volta em reais: 5.378,00!',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcRSdBVTDlpUlMlnHp6BzpaxEWwh4CZL7J0CXRs343QvYclVqV4xoZ9aJ5RK_l5OxMm6I22PM7Hwh3pZQJVwz2XEt47d1-r885WJNwPokA',
    ),
    Destination(
      name: 'Nova York - EUA - Ida e Volta em reais: 3.680,00!',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSMWFNxcS_ZdZpTQOIJEKUYz04djcXNaqCC6h7RnhffGCxuRy_GdAQ-7Xlq95OhvlV8G84LZocv5-DzxqkXLMNhEVlCE8xgQTVTQR9G9A',
    ),
    Destination(
      name: 'Roma - Itália - Ida e Volta em reais: 4.500,00!',
      imageUrl: 'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcRhc1c-9Y_sFxs058AgWCPcvriox4AM5l8ofh8eqpd0PkJrSggMjI7Bke2AlCMXsUfoZCt1rHaK1AKDAUBC5cAIr-kWoj3xBvCMnAjdAg',
    ),
    Destination(
      name: 'Madri - Espanha - Ida e Volta em reais: 3.950,00!',
      imageUrl: 'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcQ47G7LKOL9JsmOIq0qDyj14wWV8ggTOe9fg899zBjUQWj8tq60jBLDULPvQp1xHWdGlZ2WkvFX-QPUpk0YTgpwGEJtaqhdf7YA5WuJLw',
    ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(48)),
          child: AppBar(
            title: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: const [
                  Icon(Icons.flight, size: 32, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    'ExploraMundo',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Escolha o seu próximo destino com a ExploraMundo!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: featuredDestinations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: DestinationCard(destination: featuredDestinations[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
 
class DestinationCard extends StatelessWidget {
  final Destination destination;
 
  const DestinationCard({required this.destination});
 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  destination.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      destination.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DestinationDetailPage(destination: destination),
                          ),
                        );
                      },
                      child: const Text('Ver detalhes'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
 
class DestinationDetailPage extends StatelessWidget {
  final Destination destination;
 
  const DestinationDetailPage({required this.destination});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Viagem'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              destination.imageUrl,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Passeie pelas maravilhas desta cidade! Descubra pontos turísticos, gastronomia típica, cultura, idioma e muito mais!',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
class Destination {
  final String name;
  final String imageUrl;
 
  Destination({required this.name, required this.imageUrl});
}
