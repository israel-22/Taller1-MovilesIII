import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:taller_01/api/movie.dart';
import 'models/movie.dart';
import 'api/movie.dart' as http;
import 'api/movie.dart' as apiMovie; // Alias para evitar confusión
import 'package:http/http.dart' as http; // Para peticiones HTTP
//import 'services/api_service.dart';




class Pantalla1 extends StatefulWidget {
  @override
  _Pantalla1State createState() => _Pantalla1State();
}

class _Pantalla1State extends State<Pantalla1> {
  final String apiKey = 'TU_API_KEY';
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final url = Uri.parse('https://api.movieposterdb.com/v1/posters?api_key=$apiKey');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<Movie> loadedMovies = (data['data'] as List)
            .map((movieData) => Movie.fromJson(movieData))
            .toList();
        setState(() {
          movies = loadedMovies;
        });
      } else {
        throw Exception('Error al obtener datos: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Películas'),
      ),
      body: movies.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (ctx, index) {
                final movie = movies[index];
                return ListTile(
                  leading: movie.posterUrl.isNotEmpty
                      ? Image.network(movie.posterUrl, width: 50, height: 75, fit: BoxFit.cover)
                      : Icon(Icons.image_not_supported),
                  title: Text(movie.title),
                );
              },
            ),
    );
  }
}




// class HomeScreen extends StatelessWidget {
//   final ApiService _apiService = ApiService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Películas')),
//       body: FutureBuilder(
//         future: _apiService.fetchPosters(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final data = snapshot.data;
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(data[index]['title']), // Cambia según tu API
//                 );
//               },
//             );
//           }
//         },
//       ),
      
//     );
//   }
// }
