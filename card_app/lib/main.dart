import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title : Text(
          "Business Card",
          style : TextStyle(
          fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
            backgroundColor: Colors.teal,
          centerTitle: true,

        ),
        body: Center(
          child: Card(
            elevation: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12), // rounded corners
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "SS",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


                const SizedBox(height: 15),
                Text(
                  "Sahil Siddqui",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                  ),
                ),

                SizedBox(height: 12),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.teal),
                    SizedBox(width: 15),
                    Text(
                      "+91 9876543210",
                      style: TextStyle(color: Colors.teal),
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color: Colors.tealAccent),
                    SizedBox(width: 10),
                    Text(
                      "sahil@example.com",
                      style: TextStyle(color: Colors.teal),
                    ),
                  ],
                ),
              ],
            ),
          )

        ),
      ),
    );
  }
}
