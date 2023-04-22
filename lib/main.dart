import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tell me yes or no'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  double p = 0.5;
  final rnd = Random();
  String text = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              height: 56.0,
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            InkWell(
              onTap: () {
                //PROBABILITTY OF EVENT
                var randvalue = (rnd.nextDouble() * (1 - 0) + 0);
                print(randvalue);

                //CONDITION in range 0 - p
                if (controller.text.isNotEmpty &&
                    randvalue > 0.0 &&
                    randvalue < p) {
                  setState(() {
                    text = 'NO';
                  });

                  //CONDITION in range p - 1
                } else if (controller.text.isNotEmpty &&
                    randvalue >= p &&
                    randvalue < 1) {
                  setState(() {
                    text = 'YES';
                  });
                }
              },
              child: Container(
                height: 60.0,
                width: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue),
                child: const Center(
                  child: Text(
                    'ANSWER',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 45.0,
            ),
            Container(
              height: 80.0,
              width: 170.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 36.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
