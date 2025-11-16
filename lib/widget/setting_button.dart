import 'package:flutter/material.dart';

class SettingExample extends StatelessWidget {
  const SettingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          // Tombol Setting (gunakan gambar sendiri)
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true, // klik luar = tutup
              builder: (context) => const SettingPopup(),
            );
          },
          child: Image.asset(
            'assets/ui/SettingButton.png',
            width: 60,
            height: 60,
          ),
        ),
      ),
    );
  }
}

// ============================
// POPUP UI
// ============================
class SettingPopup extends StatelessWidget {
  const SettingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Popup Box
            Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),

                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  _menuItem("Sound"),
                  const SizedBox(height: 15),

                  _menuItem("Music"),
                  const SizedBox(height: 15),

                  _menuItem("Exit"),

                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Tombol CLOSE pakai icon bawaan
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.close,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Item menu
  Widget _menuItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
