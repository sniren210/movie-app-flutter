import 'package:flutter/material.dart';
import 'package:movies/movies.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail(this.movie);

  final Movie movie;
  final String imagePath = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    String path = imagePath + movie.posterPath;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height * 0.99,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title),
              background: Hero(
                tag: movie.id,
                child: Image.network(
                  path,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 10,
            ),
            Text(
              'Release Date: ${movie.releaseDate}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Overview:',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            Container(
              height: height - 110,
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                '${movie.overview}',
                softWrap: true,
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
