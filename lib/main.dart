import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_exam/views/homePage.dart';
import 'package:flutter_final_exam/views/splashScreenE1.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAV8pQE1Wj6ukD67KGlwEJOwB9b38zkhfw",
      appId: "1:857942257971:web:a3426403ba09b260960e46",
      messagingSenderId: "857942257971",
      projectId: "fir-5f5a5",
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String applicationTitle = 'Softhree Order Application';
    Wakelock.enable();
    return MaterialApp(
      title: applicationTitle,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      //home: MySplashApp(),
      //home: SplashScreen(),
      //home: MyWidget(),
      //home: HomePage(),
    );
  }
}

class MySplashApp extends StatefulWidget {
  const MySplashApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MySplashApp> {
  @override
  Widget build(BuildContext context) {
    return SofthreeSplashScreen(
      seconds: 14,
      navigateAfterSeconds: HomePage(),
      title: const Text(
        'Welcome In SplashScreen',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      image: Image.asset(
        'assets/images/profile-image.jpeg',
        width: 80,
        height: 80,
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: const TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.red,
      loadingText: const Text('Loading Text'),
      loadingTextPadding: const EdgeInsets.all(5),
      useLoader: true,
    );
  }
}

class AfterSplash extends StatelessWidget {
  const AfterSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome In SplashScreen Package",
        ),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          "Done!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BSOCS - FINAL TERM",
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            width: 80.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: const Center(
              child: Text(
                'Hello World',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                width: 80.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Hello World',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                width: 80.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Hello World',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
