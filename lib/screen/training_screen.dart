import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/materi.dart';
import '../widget/plank_info.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  /// SUB BAB ITEM
  Widget _trainingSubBab(BuildContext context, int bab, int subBab) {
    final size = MediaQuery.of(context).size;
    final bool isTablet = size.width >= 900;


    return InkWell(
      onTap: () {
        print("Bab $bab diklik");
        GoRouter.of(context).push('/traininggame${bab + 1}${subBab + 1}');
      },
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Image.asset(
            'assets/ui/kertasPipih.png',
            width: double.infinity,
            height: isTablet
                ? size.height * 0.22   // Tablet
                : size.height * 0.10,  // Handphone,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.06),
            child: Text(
              Materi.subBab[bab][subBab],
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.040,
                fontFamily: 'Baskerville',
                // fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// BAB
  Widget _trainingBab(BuildContext context, int bab) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Materi.bab[bab],
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontFamily: 'LuckiestGuy',
            // fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        _trainingSubBab(context, bab, 0),
        _trainingSubBab(context, bab, 1),
        _trainingSubBab(context, bab, 2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/TrainingBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            const Spacer(flex: 4),

            Flexible(
              flex: 4,
              child: PlankInfo(
              backgroundImage: 'assets/ui/Mading_medium.png',
                showLeftButton: false,
                showRightButton: false,
                child: Row(
                  children: [
                    const Spacer(flex: 1),

                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          const Spacer(flex: 1),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: EdgeInsets.all(size.width * 0.02),
                              child: ListView(
                                children: [
                                  _trainingBab(context, 0),
                                  SizedBox(height: size.height * 0.02),
                                  _trainingBab(context, 1),
                                  SizedBox(height: size.height * 0.02),
                                  _trainingBab(context, 2),
                                  SizedBox(height: size.height * 0.02),
                                  _trainingBab(context, 4),
                                  SizedBox(height: size.height * 0.02),
                                  _trainingBab(context, 5),
                                  SizedBox(height: size.height * 0.02),
                                  _trainingBab(context, 6),
                                  SizedBox(height: size.height * 0.02),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(flex: 1),
                        ],
                      ),
                    ),

                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),

            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}