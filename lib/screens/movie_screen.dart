import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieScreen extends StatelessWidget {
  final List<Movie> favoriteMovies = [
    Movie(
        director: "Christopher Nolan",
        releaseYear: 2023,
        title: "Oppenheimer",
        posterUrl:
            "https://movies.universalpictures.com/media/opr-tsr1sheet3-look2-rgb-3-1-1-64545c0d15f1e-1.jpg"),
    Movie(
        director: "Zack Snyder",
        releaseYear: 2013,
        title: "Man of Steel",
        posterUrl:
            "http://2.bp.blogspot.com/-V4wozefHUw4/UYQSw_Nhc4I/AAAAAAAAAL8/eY5-aDts1eI/s1600/man-of-steel-+new+flying+poster.jpg"),
    Movie(
        director: 'Quentin Tarantino',
        title: 'Kill BIll Vol.1',
        releaseYear: 2003,
        posterUrl:
            "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT2n6mrijVjYMAFEQ1DUaKCp0P02YwVyzAO9Hf1ypNEPvsJk835"),
    Movie(
        director: "David Fincher",
        releaseYear: 1999,
        title: "fight club",
        posterUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw3__ptLTHyk_K5QoGfL7OCzXU05LncsZM1A&usqp=CAU"),
    Movie(
        director: "Josh Boone",
        releaseYear: 2014,
        title: "The Fault in Our Stars",
        posterUrl:
            "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR6N8kOvrQrjIEBjIFjcP4qXTSSETEoR1J2CeFl5gtlcufQ9PKP"),
    Movie(
        director: "Tim Johnson",
        releaseYear: 2015,
        title: "Home",
        posterUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgBvtLbdotFhbnsspMrqg9spxq8Y_a9y1bIaXpgqBYLRTHtTvl"),
    Movie(
        director: "Guy Ritchie",
        releaseYear: 2023,
        title: "Operation Fortune",
        posterUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTnSuXyUtRNvTVgRqecf6adYdrkGHmFxe-_84RXazjtCvTLd1UI"),
    Movie(
        director: "David Leitch",
        releaseYear: 2018,
        title: "Deadpool 2",
        posterUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEaMyt21dd-I0jmKj9YO98a6F02iDp30uuitOjyVoIIp342NI0"),
    Movie(
        director: "Sam Hargrave",
        releaseYear: 2020,
        title: "Extraction",
        posterUrl:
            "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRELEr5bWH1Z9ZlYjofDbRoW0ToFJop6YlcJuVU8lAYt2peph_n"),
    Movie(
        director: "Rob Cohen",
        releaseYear: 2018,
        title: "hurricane heist",
        posterUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJDPMwFDj7aoEnNvlWSphJIKz2aOLsg_tX_96DBGV2iXTdDhOF"),
  ];

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
                Text("Director:${movie.director}",style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                Text("Release Year: ${movie.releaseYear}",style: TextStyle(color: Colors.white)),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close",style: TextStyle(color: Colors.white)),)
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite Movies",style: TextStyle(color: Colors.white),),
        shadowColor: Color(0xFF3232EB),
        backgroundColor: const Color.fromARGB(255, 65, 0, 243),
      ),
      body: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: favoriteMovies.length,
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: const Color.fromARGB(255, 205, 7, 7),
          ),
          itemBuilder: (context, index) {
            final movie = favoriteMovies[index];
            final imageHeight = screenWidth * 0.2; // Adjust this ratio as needed

            return Card(
              color: Colors.black,
              child: ListTile(
                leading: Image.network(
                  movie.posterUrl,
                  height: imageHeight,
                  width: imageHeight * 0.7, // Adjust the image width proportionally
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
      ),
    );
  }
}


