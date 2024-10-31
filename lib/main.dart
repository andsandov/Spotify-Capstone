import 'dart:developer';
import 'dart:html' as html;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpotifyAuth {
  final String clientId = ''; // Replace with your client ID
  final String redirectUri = 'http://localhost:8000/callback';
  final String scopes = 'user-read-private user-read-email user-library-read playlist-read-private';

  void authenticate() {
    final url = 'https://accounts.spotify.com/authorize?response_type=token&client_id=$clientId&redirect_uri=$redirectUri&scope=$scopes';

    // Redirect the user to Spotify for authentication
    html.window.location.href = url;
  }

  String? getAccessToken() {
    // Extract the access token from the URL fragment after redirect
    final fragment = html.window.location.hash;
    if (fragment.contains('access_token=')) {
      final token = fragment.split('&')[0].split('=')[1];
      return token; // Return the access token
    }
    return null;
  }
}

class SpotifyService {
  Future<List<dynamic>> fetchPlaylists(String token) async {
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/me/playlists'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['items']; // Return the list of playlists
    } else {
      throw Exception('Failed to load playlists');
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SpotifyAuth spotifyAuth = SpotifyAuth();
  final SpotifyService spotifyService = SpotifyService();
  String? accessToken;
  List<dynamic> playlists = [];

  @override
  void initState() {
    super.initState();

    // Handle the Spotify callback
    if (html.window.location.pathname == '/callback') {
      final token = spotifyAuth.getAccessToken();
      if (token != null) {
        setState(() {
          accessToken = token; // Save the access token
        });
        _fetchPlaylists(token);
      }
    }
  }

  Future<void> _fetchPlaylists(String token) async {
    try {
      final fetchedPlaylists = await spotifyService.fetchPlaylists(token);
      setState(() {
        playlists = fetchedPlaylists; // Update the state with the playlists
      });
    } catch (e) {
      log('Error fetching playlists: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Spotify App')),
        body: Center(
          child: accessToken == null
              ? ElevatedButton(
            onPressed: () {
              spotifyAuth.authenticate();
            },
            child: const Text('Login with Spotify'),
          )
              : playlists.isEmpty
              ? const CircularProgressIndicator() // Show loading indicator while fetching
              : ListView.builder(
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return ListTile(
                title: Text(playlist['name']),
                subtitle: Text(playlist['description'] ?? 'No description'),
                leading: Image.network(playlist['images'][0]['url'], width: 50),
              );
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}