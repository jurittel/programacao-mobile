import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const TheJogoApp());
}

class TheJogoApp extends StatelessWidget {
  const TheJogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Jogo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TheJogoPage(),
    );
  }
}

class TheJogoPage extends StatefulWidget {
  const TheJogoPage({super.key});

  @override
  State<TheJogoPage> createState() => _TheJogoPageState();
}

class _TheJogoPageState extends State<TheJogoPage> {
  int? treasure;
  int? bomb;
  int? monster;
  String message = 'Ache o tesouro!';
  bool gameOver = false;

  List<String> tiles = List.generate(20, (index) => '${index + 1}');
  List<bool> disabled = List.generate(20, (index) => false);

  void startNewGame() {
    final random = Random();
    Set<int> numbers = {};

    while (numbers.length < 3) {
      numbers.add(random.nextInt(20) + 1);
    }

    final nums = numbers.toList();
    treasure = nums[0];
    bomb = nums[1];
    monster = nums[2];

    tiles = List.generate(20, (index) => '${index + 1}');
    disabled = List.generate(20, (index) => false);
    message = 'Ache o tesouro!';
    gameOver = false;
    setState(() {});
  }

  void handleTap(int index) {
    if (gameOver || disabled[index]) return;

    int chosen = index + 1;

    setState(() {
      if (chosen == treasure) {
        tiles[index] = '🏆';
        message = 'Parabéns! Encontrou o tesouro!';
        gameOver = true;
        disabled = List.generate(20, (_) => true);
      } else if (chosen == bomb) {
        tiles[index] = '💣';
        message = 'Eita! Encontrou uma bomba!';
        gameOver = true;
        disabled = List.generate(20, (_) => true);
      } else if (chosen == monster) {
        tiles[index] = '👾';
        message = 'Eita! O monstro te pegou!';
        gameOver = true;
        disabled = List.generate(20, (_) => true);
      } else {
        tiles[index] = '❓';
        message = 'O tesouro está em um número ' +
            (chosen < treasure! ? 'maior' : 'menor') +
            '.';
        disabled[index] = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Bem vindo ao The Jogo!'),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Novo Jogo'),
              onPressed: startNewGame,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                textStyle: const TextStyle(fontSize: 14),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.deepPurple[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 1, // quadrado
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: disabled[index] ? null : () => handleTap(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[300],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        tiles[index],
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
