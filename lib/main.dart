import 'package:flutter/material.dart';
import 'package:jobs_app/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

AppRouter appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
