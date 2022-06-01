import 'package:movies/movies.dart';

GoRouter get routes => GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return MainPage();
        },
      )
    ]);
