import 'dart:developer';
import 'dart:html' as html;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  // TODO replace current title with the name of the app
  const LoginPage({super.key, this.title = "Login Page"});

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: const TextStyle(fontSize: 30),
            ),
            TextButton(
              // TODO onPressed should go to Spotify login from Spotify API
              onPressed: () {},
              child: const Text('test button')
            )
          ],
        ),
      ),
    );
  }
}