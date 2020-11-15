import 'package:flutter/material.dart';

import 'ui/MovieListView.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Movie',
    debugShowCheckedModeBanner: false,
    home: MovieListView(),
  ));
}
