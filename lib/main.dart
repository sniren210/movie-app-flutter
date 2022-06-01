import 'package:flutter/material.dart';
import 'package:movies/movies.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocaleSetting(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeSetting(),
        ),
      ],
      builder: (context, child) {
        final LocaleSetting locale = context.watch();
        final ThemeSetting theme = context.watch();

        return MaterialApp.router(
          title: 'My Movies',
          locale: locale.appLocal,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: theme.darkTheme ? darkTheme : lightTheme,
          darkTheme: darkTheme,
          routeInformationParser: routes.routeInformationParser,
          routerDelegate: routes.routerDelegate,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
