import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<void> saveTask() async {
    final prefs = await SharedPreferences.getInstance();
    String encodedData = jsonEncode(todoList);
    await prefs.setString('todoData', encodedData);
  }

  Future<void> loadTask() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? savedData = prefs.getString('todoData');
      if (savedData != null && savedData.isNotEmpty) {
        setState(() {
          final decoded = jsonDecode(savedData);
          if (decoded is List) {
            todoList = List<Map<String, dynamic>>.from(decoded);
          }
        });
      }
    }
    catch (e) {
      print("error loading task : $e");
    }
  }
  @override
  void initState() {
    super.initState();
    loadTask();
  }

  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> todoList = [];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    String formattedDate = "${months[now.month - 1]} ${now.day}";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Focus App',
      home: Scaffold(
        backgroundColor: const Color(0xFF111318),
        appBar: AppBar(
          toolbarHeight: 100,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              const Text(
                "Focus List",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF111318),
          centerTitle: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _controller,
                  decoration: InputDecoration(
                    fillColor: Colors.deepPurpleAccent,
                    labelText: 'Enter the Task',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              if (todoList.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'No tasks yet!! Add some tasks to the list',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                )
              else
                ...todoList.asMap().entries.map((entry) {
                  int index = entry.key;
                  var task = entry.value;
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.horizontal,
                    background: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.green[900],
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.check, color: Colors.white),
                    ),
                    secondaryBackground: Container(
                      alignment: Alignment.centerRight,
                      color: const Color(0xFF7F1D1D),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        setState(() {
                          todoList[index]['isDone'] = !todoList[index]['isDone'];
                        });
                        saveTask(); // SAVE after toggling completion
                        return false;
                      } else {
                        return true;
                      }
                    },
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        setState(() {
                          todoList.removeAt(index);
                        });
                        saveTask(); // SAVE after deleting
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1F27),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: task['isDone']
                              ? Colors.green.withValues(alpha: 0.8)
                              : Colors.deepPurpleAccent.withValues(alpha: 0.8),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            task['isDone'] ? Icons.check_circle : Icons.circle_outlined,
                            color: task['isDone'] ? Colors.lightGreenAccent : Colors.white70,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                task['isDone']
                                    ? "${task['name']} (Completed)"
                                    : "${task['name']}",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: task['isDone'] ? Colors.grey : Colors.white,
                                  decoration: task['isDone'] ? TextDecoration.lineThrough : null,
                                ),
                              ),
                            ),
                          ),
                          const Icon(Icons.swipe, color: Colors.redAccent, size: 16),
                        ],
                      ),
                    ),
                  );
                }).toList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            String taskName = _controller.text.trim();
            setState(() {
              bool alreadyExists = todoList.any((element) => element['name'] == taskName);
              if (taskName.isNotEmpty && !alreadyExists) {
                todoList.add({'name': taskName, 'isDone': false});
                _controller.clear();
              }
            });
            saveTask();
          },
          backgroundColor: Colors.deepPurpleAccent,
          label: const Text(
            'ADD TASK',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          icon: const Icon(Icons.refresh, color: Colors.white),
        ),
      ),
    );
  }
}