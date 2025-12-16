import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Widget child;
  final String backgroundPath;
  final bool showCurrency;
  final String priceText;
  final VoidCallback? onTap;

  const ItemCard({
    super.key,
    required this.child,
    this.backgroundPath = 'assets/ui/kertas_small.png',
    this.showCurrency = true,
    this.priceText = "10.000",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // skala berdasarkan lebar layar
    final double cardWidth = size.width * 0.25;   // 25% layar
    final double cardHeight = cardWidth * 1;    // rasio tinggi

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: cardWidth,
        height: cardHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundPath),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(child: child),
                ),

                if (showCurrency) ...[
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/ui/currency.png',
                        width: cardWidth * 0.18,
                        height: cardWidth * 0.18,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          priceText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: cardWidth * 0.12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: const [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
