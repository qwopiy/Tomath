import 'package:flutter/material.dart';
import 'package:tomath/widget/plank_info.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final w = width / 400;
    final h = height / 800;

    return Scaffold(
      backgroundColor: const Color(0xffe8b882),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/HomeBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Expanded(flex: 2, child: SizedBox()),

            Expanded(
              flex: 8,
              child: PlankInfo(
                backgroundImage: 'assets/ui/PapanMadingNew.png',

                buttonWidth: 150 * w,
                buttonHeight: 50 * h,

                showLeftButton: false,
                showRightButton: true,
                rightButtonText: "Enter",
                rightButtonOnTap: () {},
                rightButtonAlignment: Alignment.bottomRight,
                rightButtonPadding: EdgeInsets.only(
                  right: 70 * w,
                  bottom: 65 * h,
                ),

                child: Padding(
                  padding: EdgeInsets.all(70 * w),
                  child: ListView(
                    children: [
                      // Event card
                      InkWell(
                        onTap: () {
                          print("Event diklik");
                        },
                        child: LayoutBuilder(
                          builder: (context, c) {
                            final cw = c.maxWidth;

                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: cw,
                                  height: cw * 0.7,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/ui/KertasGede.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: EdgeInsets.all(20 * w),
                                  child: Row(
                                    children: [
                                      //char picture
                                      Image.asset(
                                        'assets/ui/Home.png',
                                        width: 70 * w,
                                        height: 100 * h,
                                        fit: BoxFit.fill,
                                      ),

                                      SizedBox(width: 10 * w),

                                      Expanded(
                                        // Event info
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "MONTHLY QUIZ",
                                              style: TextStyle(
                                                fontSize: 14 * w,
                                                color: Colors.black,
                                                fontFamily: "Baskerville",
                                              ),
                                            ),

                                            SizedBox(height: 10 * h),

                                            Text(
                                              "Material:",
                                              style: TextStyle(
                                                fontSize: 13 * w,
                                                color: Colors.black,
                                                fontFamily: "Baskerville",
                                              ),
                                            ),
                                            Text(
                                              "Question Example",
                                              style: TextStyle(
                                                fontSize: 13 * w,
                                                color: Colors.black,
                                                fontFamily: "Baskerville",
                                              ),
                                            ),

                                            Text(
                                              "Reward:",
                                              style: TextStyle(
                                                fontSize: 14 * w,
                                                color: Colors.black,
                                                fontFamily: "Baskerville",
                                              ),
                                            ),

                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/ui/currency.png',
                                                  width: 14 * w,
                                                  height: 14 * h,
                                                ),
                                                SizedBox(width: 10 * w),
                                                Text(
                                                  "100",
                                                  style: TextStyle(
                                                    fontSize: 14 * w,
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
                                              ],
                                            ),

                                            SizedBox(height: 5 * h),

                                            Text(
                                              "14 days remaining",
                                              style: TextStyle(
                                                fontSize: 14 * w,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
