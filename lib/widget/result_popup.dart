import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultPopup extends StatelessWidget {
  final String resultText;
  final String descriptionText;
  final int reward;

  const ResultPopup({
    super.key,
    required this.resultText,
    required this.descriptionText,
    required this.reward,
  });

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
                image: const DecorationImage(
                  image: AssetImage('assets/ui/KertasGede.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Description
                  Text(
                    descriptionText,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Money
                  Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/ui/kertasPipihPol.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          // Icon money
                          Image(
                            image: AssetImage('assets/ui/currency.png'),
                            width: 40,
                            height: 40,
                          ),
                          // Text money
                          Text(
                            ': $reward',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  // Button OK
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).go('/home');
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/ui/NavbarKayu.png'),
                      fit: BoxFit.fill
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
