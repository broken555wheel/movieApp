//creating a class that captures all of the data of a movie
class Movie {
  final String director;
  final int releaseYear;
  final String title;
  String posterUrl;
  //creating the constructor to create a new movie(object)
  Movie(
      {required this.director,
      required this.releaseYear,
      required this.title,
      required this.posterUrl});
}
