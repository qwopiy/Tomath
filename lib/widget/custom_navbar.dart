import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomNavbar({super.key, required this.currentIndex});

  bool _isTabActive(int index) => index == currentIndex;

  double _getButtonWidth(int index) => _isTabActive(index) ? 70 : 65;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return SafeArea(
      top: false,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/ui/Navbar_small.png',
            width: screenWidth,
            height: screenHeight * 0.11,
            fit: BoxFit.fill,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                context,
                index: 0,
                path: '/shop',
                iconPath: 'assets/ui/shop.png',
                buttonText: 'Toko',
              ),
              _buildNavItem(
                context,
                index: 1,
                path: '/event',
                iconPath: 'assets/ui/event.png',
                buttonText: 'Acara',
              ),
              _buildNavItem(
                context,
                index: 2,
                path: '/home',
                iconPath: 'assets/ui/Home1.png',
                buttonText: 'Beranda',
              ),
              _buildNavItem(
                context,
                index: 3,
                path: '/training',
                iconPath: 'assets/ui/training.png',
                buttonText: 'Latihan',
              ),
              _buildNavItem(
                context,
                index: 4,
                path: '/profile',
                iconPath: 'assets/ui/Home.png',
                buttonText: 'Profil',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required String path,
    required String iconPath,
    required String buttonText,
  }) {
    final isActive = _isTabActive(index);
    final width = _getButtonWidth(index);

    return GestureDetector(
      onTap: () {
        context.go(path);
      },
      child: Transform.translate(
        offset: Offset(0, isActive ? -10 : 0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/ui/kertasKecil.png',
              width: width + 10,
              height: width + 14,
              fit: BoxFit.contain,
            ),
            Image.asset(
              iconPath,
              width: width,
              height: width,
              fit: BoxFit.contain,
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFFF7EFD3),
                  fontFamily: 'LuckiestGuy',
                  shadows: [
                    Shadow(offset: Offset(2, 2), blurRadius: 0, color: Colors.black),
                    Shadow(offset: Offset(-2, -2), blurRadius: 0, color: Colors.black),
                    Shadow(offset: Offset(2, -2), blurRadius: 0, color: Colors.black),
                    Shadow(offset: Offset(-2, 2), blurRadius: 0, color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}