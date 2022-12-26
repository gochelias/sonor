import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:sonor/main.dart';
import 'package:sonor/screens/albums_screen.dart';
import 'package:sonor/screens/screens.dart';

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
          return SonorStatefullWidget(child: child);
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
