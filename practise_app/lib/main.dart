import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  List<String> todoList = [];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("To Do List",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
          )),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: Column(
          children : [
            Padding(
            padding : const EdgeInsets.all(20),
            child : TextField(
              controller : _controller,
              decoration : InputDecoration(
                labelText : 'Enter the Task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

              )

            )
            ),
            ...todoList.map((task){
              return Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(task,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ))
                  ],
                )
                );
            }).toList(),
          ],
        ),

        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){
              setState(() {
                if(_controller.text.isNotEmpty) {
                  todoList.add(_controller.text);
                  _controller.clear();
                }
              });
            },
            backgroundColor: Colors.blueAccent,
            label: Text('ADD TASK',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
            ),
            icon: Icon(Icons.refresh),
            ),


      )
    );

  }
}

