import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screen/campaign_game_screen.dart';
import '../screen/dialogue_screen.dart';
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
  static const String dialogue = '/dialogue';
  static const List<List<String>> campaignGame = [
    ['/campaigngame11', '/campaigngame12', '/campaigngame13'],
    ['/campaigngame21', '/campaigngame22', '/campaigngame23'],
    ['/campaigngame31', '/campaigngame32', '/campaigngame33'],
    ['/campaigngame41', '/campaigngame42', '/campaigngame43'],
    ['/campaigngame51', '/campaigngame52', '/campaigngame53'],
    ['/campaigngame61', '/campaigngame62', '/campaigngame63'],
  ];
  static const List<List<String>> trainingGame = [
    ['/traininggame11', '/traininggame12', '/traininggame13'],
    ['/traininggame21', '/traininggame22', '/traininggame23'],
    ['/traininggame31', '/traininggame32', '/traininggame33'],
    ['/traininggame41', '/traininggame42', '/traininggame43'],
    ['/traininggame51', '/traininggame52', '/traininggame53'],
    ['/traininggame61', '/traininggame62', '/traininggame63'],
  ];
}

GoRouter createRouter() {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();


  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.dialogue,
    routes: [
      GoRoute(
        path: AppRoutes.dialogue,
        name: 'dialogue',
        builder: (context, state) => const DialogueScreen(),
      ),
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
      for (int i = 0; i <= 5; i++)
        for (int j = 0; j <= 2; j++)
          GoRoute(
            path: AppRoutes.trainingGame[i][j],
            name: 'traininggame${i + 1}${j + 1}',
            builder: (context, state) => TrainingGameScreen(bab: i + 1, subBab: j + 1),
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
