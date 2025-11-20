import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tomath/screen/campaign_screen.dart';
import 'package:tomath/screen/event_screen.dart';
import 'package:tomath/screen/home_screen.dart';
import 'package:tomath/screen/profile_screen.dart';
import 'package:tomath/screen/shop_screen.dart';
import 'package:tomath/screen/training_screen.dart';
import 'package:tomath/widget/home_app_scaffold.dart';

class AppRoutes {
  static const String shop = '/shop';
  static const String event = '/event';
  static const String home = '/home';
  static const String training = '/training';
  static const String profile = '/profile';
  static const String campaign = '/campaign';
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
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.campaign,
                name: 'campaign',
                builder: (context, state) => CampaignScreen(),
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