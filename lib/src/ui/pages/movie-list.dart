import 'package:flutter/material.dart';
import 'package:movies/movies.dart';
import 'package:provider/provider.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final String icnBase = 'https://image.tmdb.org/t/p/w500/';
  final String defaultImage =
      'https//image.freeimages.com/images/large-previews/5eb/moview-clapboard-1184339.jpg';
  late HttpHelper helper;
  late int moviesCount = -1;
  late List movies;
  Icon visibleIcon = Icon(Icons.search);
  Widget searchBar = Text('Movies');
  bool autoFocus = false;
  bool _isLoading = false;

  Future search(text) async {
    movies = await helper.findMovies(text);
    setState(() {
      moviesCount = movies.length;
    });
  }

  Future initialize() async {
    movies = [];
    setState(() {
      _isLoading = true;
    });
    await helper.getUpcoming().then((value) {
      setState(() {
        movies = value;
        moviesCount = movies.length;
        _isLoading = false;
        print(movies);
      });
    });
  }

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeSetting theme = context.watch();
    final LocaleSetting locale = context.read();

    NetworkImage image;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          theme.toggleTheme();
        },
        child: Text(context.l10n.helloWorld),
      ),
      appBar: AppBar(
        title: searchBar,
        actions: [
          IconButton(
            icon: visibleIcon,
            onPressed: () {
              setState(() {
                if (visibleIcon.icon == Icons.search) {
                  visibleIcon = Icon(Icons.cancel);
                  setState(() {
                    autoFocus = true;
                  });
                  searchBar = TextField(
                    textInputAction: TextInputAction.search,
                    autofocus: autoFocus,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    onSubmitted: (String text) {
                      search(text);
                    },
                  );
                } else {
                  visibleIcon = Icon(Icons.search);
                  searchBar = Text('Movies');
                  movies = [];
                  initialize();
                }
              });
            },
          )
        ],
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: moviesCount,
                itemBuilder: (BuildContext context, int position) {
                  if (movies[position].posterPath != null) {
                    image = NetworkImage(icnBase + movies[position].posterPath);
                  } else {
                    image = NetworkImage(defaultImage);
                  }
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MovieDetail(movies[position])));
                      },
                      title: Text(movies[position].title),
                      subtitle: Text(
                          'Released: ${movies[position].releaseDate} -Vote: ${movies[position].voteAverage}'),
                      leading: Hero(
                        tag: movies[position].id,
                        child: CircleAvatar(
                          backgroundImage: image,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
