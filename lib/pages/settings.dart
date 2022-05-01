import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text('Настройки'),
          centerTitle: true,
        ),
        body: Container(
            margin: const EdgeInsets.fromLTRB(60.0, 60.0, 10.0, 30.0),
            child:Column(
              children: [
                const Text('Страница с настройфками', style: TextStyle(color: Colors.white),),
                TextButton.icon(onPressed: () {
                  Navigator.pushNamed(context, '/');     // c возвратом
                },
                    label: const Text('Назад'),
                    icon: const Icon(Icons.arrow_back)),
              ],
            )
        ),
    );
  }
}