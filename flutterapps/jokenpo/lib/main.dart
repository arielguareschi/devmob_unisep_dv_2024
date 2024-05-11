import 'package:flutter/material.dart';

void main() {
  runApp(const JokenpoApp());
}

class JokenpoApp extends StatefulWidget {
  const JokenpoApp({super.key});

  @override
  State<JokenpoApp> createState() => _JokenpoAppState();
}

class _JokenpoAppState extends State<JokenpoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Jokenpo")),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.refresh),
            )
          ],
        ),
        body: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: null,
                  child: Text("Pedra"),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text("Papel"),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text("Tesoura"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("Você"),
                    Text("PEDRA"),
                  ],
                ),
                Column(
                  children: [
                    Text(""),
                    Text("X"),
                  ],
                ),
                Column(
                  children: [
                    Text("Computador"),
                    SizedBox(
                      height: 20,
                      child: Text("Tesoura"),
                    ),
                  ],
                ),
              ],
            ),
            Text("Você ganhou!"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Placar"),
            ),
            Text("Você: 0 pontos"),
            Text("computador: 0 pontos"),
          ],
        ),
      ),
    );
  }
}
