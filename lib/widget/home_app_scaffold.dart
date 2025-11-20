import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tomath/widget/custom_navbar.dart';
import 'package:tomath/widget/home_appbar.dart';


class HomeAppScaffold extends StatefulWidget {
  final Widget child;

  const HomeAppScaffold({super.key, required this.child});

  @override
  State<HomeAppScaffold> createState() => _HomeAppScaffoldState();
}

class _HomeAppScaffoldState extends State<HomeAppScaffold> {
  int _getTabIndex(String location) {
    if (location.startsWith('/shop')) return 0;
    if (location.startsWith('/event')) return 1;
    if (location.startsWith('/home')) return 2;
    if (location.startsWith('/training')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final String location = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
    final int currentIndex = _getTabIndex(location);

    return Scaffold(
      body: Stack(
        children: [

          widget.child,

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            alignment: Alignment.topCenter,
            padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 10),
            child: HomeAppbar(),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: CustomNavbar(currentIndex: currentIndex),
          ),
        ],
      ),
    );
  }
}