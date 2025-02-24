import 'dart:developer';

import 'package:flutter/material.dart';
import '../assets/constants.dart' as constants;

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title = "Home Page"});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [TitleSection(), ButtonSection()],
      ),
    ));
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: Text(
            constants.appName,
            style: Theme.of(context).textTheme.headlineLarge,
          )),
          Flexible(
              child: Text(
            constants.appDescription,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () {
                log("clicked Sign In");
              },
              child: const Text(constants.signIn)),
          TextButton(
              onPressed: () {
                log("clicked Join Live");
              },
              child: const Text(constants.joinLive))
        ],
      ),
    );
  }
}
