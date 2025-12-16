import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tomath/widget/woodbutton.dart';

import '../service/app_state_provider.dart';

class Dialogue extends StatefulWidget {
  final VoidCallback onTap;
  final String textContent;
  final String buttonText;

  const Dialogue({
    super.key,
    required this.buttonText,
    required this.textContent,
    required this.onTap,
  });

  @override
  State<Dialogue> createState() => _DialogueState();
}

class _DialogueState extends State<Dialogue> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          final size = MediaQuery.of(context).size;

          final panelHeight = size.height * 0.30;

          final topMargin = size.height * 0.55;

          return Container(
            height: panelHeight,
            margin: EdgeInsets.only(top: topMargin),
            padding: EdgeInsets.all(size.width * 0.05),

            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ui/Kertas_big.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1,
                    child: Padding(padding: EdgeInsets.only(left:size.width * 0.05),
                      child:
                        Text(
                          "Mbak stroberi",
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'BaskervvilleSC',
                          ),
                        ),
                    ),
                ),
                Expanded(flex: 3,
                    child: SingleChildScrollView(
                      child: Padding(padding: EdgeInsets.only(left:size.width * 0.05),
                        child:
                        Text(
                          "apakah kamu melihat buah",
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'BaskervvilleSC',
                          ),
                        ),
                      ),

                    )
                ),
                Expanded(flex: 1,
                    child: Align(
                      alignment: Alignment.bottomRight,
                            child: WoodButton(
                              text: widget.buttonText,
                              onTap: widget.onTap,
                        )
                    )
                )
              ],
            ),
          );
        }
    );
  }
}
