// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userToDO = '';
  List todoList = [];

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();

    initFirebase();

    todoList.addAll(['Buy milk', 'Wash dishes', 'Купить картошку']);
  }

  void _menuOpen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(title: const Text('Меню'),),
              body:Row(
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  }, child: const Text('На главную')),
                  const Padding(padding: EdgeInsets.only(left: 15)),
                  const Text('Основное меню')

                ],
              )
          );
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Список дел'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _menuOpen, icon: const Icon(Icons.menu_outlined)),
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Подсказка',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Это подсказка! :)'))
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(    // редактирование записи
                          onPressed: () {
                            _userToDO = todoList[index];
                            showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Изменить элемент'),
                                content: TextFormField(
                                  initialValue: todoList[index],
                                  onChanged: (String value) {
                                    _userToDO = value;
                                  },
                                  autofocus: true,
                                ),
                                actions: [
                                  ElevatedButton(onPressed: () {
                                    setState(() {
                                      todoList[index] = _userToDO;
                                    });
                                    Navigator.of(context).pop();
                                  }, child: const Text('Изменить'))
                                ],
                              );
                            });                              },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.deepOrange,
                          )),
                      IconButton(     // удаление записи
                          onPressed: () {
                            setState(() {
                              todoList.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete_sweep,
                            color: Colors.deepOrange,
                          )),
                    ],
                  ),
                ),
              ),
              onDismissed: (direction) {
                //if (direction == DismissDirection.endToStart)
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Добавить элемент'),
              content: TextField(
                onChanged: (String value) {
                  _userToDO = value;
                },
                autofocus: true,
                onSubmitted: (_userToDO) {
                  setState(() {
                    todoList.add(_userToDO);
                  });
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    todoList.add(_userToDO);
                  });
                  Navigator.of(context).pop();
                }, child: const Text('Добавить'))
              ],
            );
          });
        },
        child: const Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
