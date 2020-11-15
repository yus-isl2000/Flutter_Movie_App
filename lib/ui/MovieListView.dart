import 'package:flutter/material.dart';
import 'package:lesson3_movies/model/movie.dart';
import 'MovieListViewDetails.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  AppBar bar = AppBar(
    title: Text('Movies'),
    backgroundColor: Colors.blueGrey.shade900,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bar,
      backgroundColor: Colors.blueGrey.shade800,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                movieCard(movieList[index], context),
                Positioned(
                  top: 10,
                  child: movieImage(movieList[index].images[0]),
                )
              ],
            );
          }),
    );
  }

  Widget movieImage(String imageURL) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imageURL),
              fit: BoxFit.cover,
            )));
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black38,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(54, 16, 8, 16),
            child: mainColumn(movie),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieListViewDetails(
              movieName: movie.title,
              movie: movie,
            ),
          ),
        );
      },
    );
  }

  Column mainColumn(Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [row1(movie), row2(movie)],
    );
  }

  Row row2(Movie movie) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: Text(
            'Released: ${movie.released}',
            style: mainTextStyle(),
          ),
        ),
        Flexible(
          child: Text(
            movie.runtime,
            style: mainTextStyle(),
          ),
        ),
        Flexible(
          child: Text(
            movie.rated,
            style: mainTextStyle(),
          ),
        ),
      ],
    );
  }

  Row row1(Movie movie) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Text(
            movie.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          'Rating: ${movie.imdbRating}/10',
          style: mainTextStyle(),
        )
      ],
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 13,
      color: Colors.grey,
    );
  }
}
