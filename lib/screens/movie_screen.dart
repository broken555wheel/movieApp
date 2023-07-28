import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});
  @override
  State<MovieScreen> createState() => MovieScreenState();
}

class MovieScreenState extends State<MovieScreen> {
  final List<Movie> favoriteMovies = [];
  final TextEditingController _movieTitle = TextEditingController();
  final TextEditingController _movieDirector = TextEditingController();
  final TextEditingController _moviePosterUrl = TextEditingController();
  final TextEditingController _movieReleaseYear = TextEditingController();
  void showMovieDetails(BuildContext context, Movie movie) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(movie.title, style: TextStyle(color: Colors.white)),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(movie.posterUrl,
                    height: 100, width: 100, fit: BoxFit.cover),
                SizedBox(
                  height: 10,
                ),
                Text("Director:${movie.director}",
                    style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                Text("Release Year: ${movie.releaseYear}",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close", style: TextStyle(color: Colors.white)),
              )
            ],
          );
        });
  }

  void saveMovieDetails() {
    final myNewMovie = Movie(
        director: _movieDirector.text,
        releaseYear: int.parse(_movieReleaseYear.text),
        title: _movieTitle.text,
        posterUrl: _moviePosterUrl.text);
    setState(() {
      favoriteMovies.add(myNewMovie);
    });
    Navigator.pop(context);
  }

  void showAddMovieDialog(BuildContext context) {
    //BuildContext  context
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add a movie'),
            content: Column(children: [
              TextField(
                controller: _movieTitle,
                decoration: InputDecoration(
                  hintText: "Enter the Movie Title",
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16,),
              TextField(
                controller: _movieDirector,
                decoration: InputDecoration(
                  hintText: "Enter the Movie Director",
                  labelText: "Director",
                  border: OutlineInputBorder(),
                ),
              ),
              
              SizedBox(height: 16,),
              TextField(
                controller: _moviePosterUrl,
                decoration: InputDecoration(
                  hintText: "Enter the Movie Poster URL",
                  labelText: "Poster URL",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16,),
              TextField(
                controller: _movieReleaseYear,
                decoration: InputDecoration(
                  hintText: "Enter the Movie Release Year",
                  labelText: "Release Yrar",
                  border: OutlineInputBorder(),
                ),
              ),
            ]),
            actions: [
              TextButton(onPressed: saveMovieDetails, child: Text("Save")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Favorite Movies",
          style: TextStyle(color: Colors.white),
        ),
        shadowColor: Color(0xFF3232EB),
        backgroundColor: const Color.fromARGB(255, 65, 0, 243),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        ElevatedButton(
          onPressed: () {
            showAddMovieDialog(context);
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              backgroundColor: Color.fromRGBO(112, 17, 238, 1),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                decorationStyle: TextDecorationStyle.double,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          child: const Text('Add Movie'),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: favoriteMovies.length,
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: const Color.fromARGB(255, 205, 7, 7),
          ),
          itemBuilder: (context, index) {
            final movie = favoriteMovies[index];
            final imageHeight =
                screenWidth * 0.2; // Adjust this ratio as needed

            return Card(
              color: Colors.black,
              child: ListTile(
                leading: Image.network(
                  movie.posterUrl,
                  height: imageHeight,
                  width: imageHeight *
                      0.7, // Adjust the image width proportionally
                  fit: BoxFit.contain,
                ),
                title: Text(movie.title, style: TextStyle(color: Colors.white)),
                onTap: () {
                  showMovieDetails(context, movie);
                },
              ),
            );
          },
        ),
      ])),
    );
  }
}
