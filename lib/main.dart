import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/screens/splash%20screen/splash.dart';

import 'provider/homeController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: "https://cjkbxthppyceqhsfferh.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNqa2J4dGhwcHljZXFoc2ZmZXJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTU5OTQ1NTAsImV4cCI6MTk3MTU3MDU1MH0.pPE9bMelJBiAcdzfjAxoTGY8notKCBe7ffZ1FlJivwI");
  // await SupabaseClient('https://cjkbxthppyceqhsfferh.supabase.co',
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNqa2J4dGhwcHljZXFoc2ZmZXJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTU5OTQ1NTAsImV4cCI6MTk3MTU3MDU1MH0.pPE9bMelJBiAcdzfjAxoTGY8notKCBe7ffZ1FlJivwI');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final HomeController _controller = HomeController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _controller),
      ],
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
