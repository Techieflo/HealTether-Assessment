import 'package:flutter/material.dart';
import 'package:heal_tether/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'providers/user_provider.dart';

Future<void> main() async {
  //we make sure to load the .env file on start of the app so that the base Url can be available  when we need to fetch the users from the api
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
