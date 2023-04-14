import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:sonor/screens/albums_screen.dart';
import 'package:sonor/screens/edit_song_screen.dart';
import 'package:sonor/screens/screens.dart';
import 'package:sonor/utils/ui/ui.dart';

router() {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');
  return GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return SonorShellLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const NoTransitionPage(child: HomeScreen());
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'songs',
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: SongsScreen());
                },
              ),
              GoRoute(
                path: 'albums',
                builder: (context, state) {
                  return const AlbumsScreen();
                },
              )
            ],
          ),
          GoRoute(
            path: '/library',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const NoTransitionPage(child: LibraryScreen());
            },
            routes: <RouteBase>[
              GoRoute(
                name: 'song',
                path: 'songs/:songId',
                parentNavigatorKey: rootNavigatorKey,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  final SongModel song = state.extra as SongModel;

                  return CustomTransitionPage(
                    child: EditSong(song: song),
                    transitionsBuilder: (
                      BuildContext context,
                      Animation animation,
                      Animation secondaryAnimation,
                      Widget child,
                    ) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(
                        CurveTween(curve: curve),
                      );

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/explore',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const NoTransitionPage(child: ExploreScreen());
            },
          )
        ],
      ),
    ],
  );
}
