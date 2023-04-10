import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: myApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
  ));
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const Icon(Icons.menu_rounded),
        title: const Text(
          'Slider With Pattern',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'Slider that will Show you Numeric Pattern Based on your interaction',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Slider(
                  onChanged: (val) {
                    setState(() {
                      i = val.toInt();
                    });
                  },
                  value: i.toDouble(),
                  min: 1,
                  max: 100,
                  divisions: 99,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: ListView.builder(
                  itemCount: i,
                  itemBuilder: (context, i) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            i,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
