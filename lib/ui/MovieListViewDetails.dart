import 'package:flutter/material.dart';
import 'package:lesson3_movies/model/movie.dart';

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Movies',
          ),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: ListView(children: [
          Column(
            children: [
              mainImage(),
              subHeadings(),
              tittleHeading(),
              plotText(),
              line(),
              MovieFeild(feild: 'Cast', value: movie.actors),
              MovieFeild(feild: 'Director', value: movie.director),
              MovieFeild(feild: 'Awards', value: movie.awards),
              line(),
              MoviePosters(posters: movie.images),
            ],
          ),
        ]));
  }

  Padding line() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 1,
        color: Colors.grey,
      ),
    );
  }

  Padding plotText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.topLeft,
        child: Text.rich(TextSpan(
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            children: <TextSpan>[
              TextSpan(text: movie.plot),
              TextSpan(text: ' MORE...')
            ])),
      ),
    );
  }

  Padding mainImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(movie.images[0]),
    );
  }

  Container tittleHeading() {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          movie.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container subHeadings() {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          '${movie.runtime}, ${movie.year}, ${movie.genre}.'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}

class MovieFeild extends StatelessWidget {
  final String feild;
  final String value;

  const MovieFeild({Key key, this.feild, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$feild: ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}

class MoviePosters extends StatelessWidget {
  final List<String> posters;

  const MoviePosters({Key key, this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'More Movie Posters'.toUpperCase(),
            style: TextStyle(
                fontSize: 18,
                color: Colors.black26,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Container(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: posters.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 160,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(posters[index]),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
