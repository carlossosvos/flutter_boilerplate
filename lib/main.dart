import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/common/themes.dart';
import 'package:flutter_boilerplate/initialize.dart';
import 'package:flutter_boilerplate/core/presentation/cubit/cubit.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    await initialize();

    runApp(const MyApp());
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppThemeCubit(),
      child: Builder(builder: (context) {
        final isLightTheme = context.watch<AppThemeCubit>().state;

        return MaterialApp(
          title: 'Flutter_Boilerplate',
          theme: isLightTheme ? lightTheme : darkTheme,
          // darkTheme: darkTheme,
          // themeMode: ThemeMode.system, // Default mode
          home: const MyHomePage(title: 'Flutter Boilerplate'),
        );
      }),
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
  void changeTheme() {
    context.read<AppThemeCubit>().changeTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press floating button to change theme ',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeTheme,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
