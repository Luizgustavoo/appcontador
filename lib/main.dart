import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int count = 0;


    void decrement() {
      setState(() {
        count--;
      });

      print(count);
    }

    void increment() {
      setState(() {
        count++;
      });
      print(count);
    }

    bool get isEmpty => count  == 0;
    bool get isFull => count ==20;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.red,
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image.jpg'),
                  fit: BoxFit.cover,
                ),
            ),
            child: BackdropFilter(
              filter:  ImageFilter.blur(sigmaX: 7.0, sigmaY: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      isFull ? 'LOTADO!' : 'PODE ENTRAR!',
                    style: TextStyle(
                      fontSize: 40,
                      color: isFull ? Colors.red : Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 120,
                        color: isFull ? Colors.red : Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: isEmpty ? null :  decrement,
                        style: TextButton.styleFrom(
                            backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                            primary: Colors.black,
                            fixedSize: const Size(100, 80),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        child: const Text(
                          'Saiu',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 32,),
                      TextButton(
                        onPressed: isFull ? null : increment,
                        style: TextButton.styleFrom(
                            backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                            primary: Colors.black,
                            fixedSize: const Size(100, 80),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        child: const Text('Entrou',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));

    }
}


