import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:wtf_flutter_projects/bottom_custom_navigation.dart';
import 'package:wtf_flutter_projects/firebase_options.dart';
import 'package:wtf_flutter_projects/pages/forgotten_password.dart';
import 'package:wtf_flutter_projects/pages/login_page.dart';
import 'package:wtf_flutter_projects/pages/onboarding_page.dart';
import 'package:wtf_flutter_projects/pages/signup_page.dart';
import 'package:wtf_flutter_projects/provider/hospital_notifier.dart';
import 'package:wtf_flutter_projects/provider/user_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GoogleSignIn.instance.initialize(
    clientId: Platform.isAndroid
        ? "709297244159-gcnrp8d4it67qkfapvo7a6hs8sv6nd36.apps.googleusercontent.com"
        : "709297244159-su2db1329ela7fc3k8mvqevcphfvc4q4.apps.googleusercontent.com",
    serverClientId:
        "709297244159-bhn7fhhdbk8bfnc74qsq19o31kauv8uh.apps.googleusercontent.com",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserNotifier()),
        ChangeNotifierProvider(create: (context) => HospitalNotifier()),
      ],

      child: MaterialApp(
        title: 'Save a Life',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 181, 58),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          "/o": (context) => OnboardingPage(),
          "/home": (context) => BottomNavigation(),
          "/login": (context) => LoginPage(),
          "/signup": (context) => SignupPage(),
          //"/contact": (context)=> ContactPage(),
          "/forgotten": (context) => ForgottenPassword(),
        },
        initialRoute: "/login",
        //home: BottomNavigation(),
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
