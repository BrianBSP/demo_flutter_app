import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/publish'),
              child: const Text('Vai a Schermata 2'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/subscribe'),
              child: const Text('Vai a schermata 3'),
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/bluetooth'),
                child: const Text('Vai a schermata 4'))
          ],
        ),
      ),
    );
  }
}
