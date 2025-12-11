import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screen/campaign_game_screen.dart';
import '../screen/event_screen.dart';
import '../screen/home_screen.dart';
import '../screen/profile_screen.dart';
import '../screen/shop_screen.dart';
import '../screen/training_screen.dart';
import '../screen/campaign_screen.dart';
import '../widget/home_app_scaffold.dart';

import '../screen/training_game_screen.dart';

class AppRoutes {
  static const String shop = '/shop';
  static const String event = '/event';
  static const String home = '/home';
  static const String training = '/training';
  static const String profile = '/profile';
  static const String campaign = '/campaign';
  static const List<List<String>> campaignGame = [
    ['/campaigngame11', '/campaigngame12', '/campaigngame13'],
    ['/campaigngame21', '/campaigngame22', '/campaigngame23'],
    ['/campaigngame31', '/campaigngame32', '/campaigngame33'],
    ['/campaigngame41', '/campaigngame42', '/campaigngame43'],
    ['/campaigngame51', '/campaigngame52', '/campaigngame53'],
    ['/campaigngame61', '/campaigngame62', '/campaigngame63'],
  ];
  static const String trainingGame1 = '/traininggame1';
  static const String trainingGame2 = '/traininggame2';
  static const String trainingGame3 = '/traininggame3';
  static const String trainingGame4 = '/traininggame4';
  static const String trainingGame5 = '/traininggame5';
  static const String trainingGame6 = '/traininggame6';

}

GoRouter createRouter() {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.home,
    routes: [
      // contoh buat ntaran
      // GoRoute(
      //   path: AppRoutes.quiz,
      //   name: 'sign-in',
      //   builder: (context, state) => const QuizScreen(),
      // ),
      GoRoute(
        path: AppRoutes.campaign,
        name: 'campaign',
        builder: (context, state) => const CampaignScreen(),
      ),
      for (int i = 0; i <= 5; i++)
        for (int j = 0; j <= 2; j++)
          GoRoute(
            path: AppRoutes.campaignGame[i][j],
            name: 'campaigngame${i + 1}${j + 1}',
            builder: (context, state) => CampaignGameScreen(bab: i + 1, subBab: j + 1),
          ),
      GoRoute(
        path: AppRoutes.trainingGame1,
        name: 'trainingGame1',
        builder: (context, state) => const TrainingGameScreen(bab: 1, subBab: 1),
      ),
      GoRoute(
        path: AppRoutes.trainingGame2,
        name: 'trainingGame2',
        builder: (context, state) => const TrainingGameScreen(bab: 2, subBab: 1),
      ),
      GoRoute(
        path: AppRoutes.trainingGame3,
        name: 'trainingGame3',
        builder: (context, state) => const TrainingGameScreen(bab: 3, subBab: 1),
      ),
      GoRoute(
        path: AppRoutes.trainingGame4,
        name: 'trainingGame4',
        builder: (context, state) => const TrainingGameScreen(bab: 4, subBab: 1),
      ),
      GoRoute(
        path: AppRoutes.trainingGame5,
        name: 'trainingGame5',
        builder: (context, state) => const TrainingGameScreen(bab: 5, subBab: 1),
      ),
      GoRoute(
        path: AppRoutes.trainingGame6,
        name: 'trainingGame6',
        builder: (context, state) => const TrainingGameScreen(bab: 6, subBab: 1),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return HomeAppScaffold(child: child);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.shop,
                name: 'shop',
                builder: (context, state) => const ShopScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.event,
                name: 'event',
                builder: (context, state) => const EventScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.training,
                name: 'training',
                builder: (context, state) => const TrainingScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],




    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              '404 - Page Not Found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text('Path: ${state.uri.path}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
