import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text('Список дел'),
          centerTitle: true,
        ),
        body: Column(
           children: [
              const Text('Main Screen', style: TextStyle(color: Colors.white),),
              ElevatedButton(onPressed: () {
                // Navigator.pushReplacementNamed(context, '/todo');  // без возврата
                // Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => false); // с возвратом отключаемым
                Navigator.pushNamed(context, '/todo');     // c возвратом
              }, child: const Text('Перейти далее')),
             TextButton.icon(onPressed: () {
               Navigator.pushNamed(context, '/settings');     // c возвратом
             },
                 label: const Text('Настройки'),
                 icon: const Icon(Icons.settings)),
           ],
        )
    );
  }
}
