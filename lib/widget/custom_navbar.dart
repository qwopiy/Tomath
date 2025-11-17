import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomNavbar({super.key, required this.currentIndex});

  bool _isTabActive(int index) => index == currentIndex;
  double _getButtonWidth(int index) => _isTabActive(index) ? 90 : 80;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      top: false,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children:[
          Image.asset(
            'assets/ui/NavbarKayu.png',
            width: screenWidth,
            height: 100,
            fit: BoxFit.cover,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                context,
                index: 0,
                path: '/shop',
                iconPath: 'assets/ui/kertasKecil.png',
                buttonText: 'Shop',
              ),

              _buildNavItem(
                context,
                index: 1,
                path: '/event',
                iconPath: 'assets/ui/kertasKecil.png',
                buttonText: 'Event',
              ),
              _buildNavItem(
                context,
                index: 2,
                path: '/home',
                iconPath: 'assets/ui/kertasKecil.png',
                buttonText: 'Home',
              ),
              _buildNavItem(
                context,
                index: 3,
                path: '/training',
                iconPath: 'assets/ui/kertasKecil.png',
                buttonText: 'Training',
              ),
              _buildNavItem(
                context,
                index: 4,
                path: '/profile',
                iconPath: 'assets/ui/kertasKecil.png',
                buttonText: 'Profile',
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildNavItem(BuildContext context, {required int index, required String path, required String iconPath, required String buttonText}) {
    final isActive = _isTabActive(index);
    final width = _getButtonWidth(index);

    return GestureDetector(
      onTap: () {
        print(path);
        context.go(path);
      },
      child: Transform.translate(
        offset: Offset(0, isActive ? -10 : 0),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Image.asset(
                iconPath,
                width: width,
                height: width,
                fit: BoxFit.contain,
              ),
              Text(buttonText,
                style: TextStyle(
                  fontSize: 10,
                  // fontFamily: 'LuckiestGuy',
                ),
              ),
            ]
        ),
      ),
    );
  }
}