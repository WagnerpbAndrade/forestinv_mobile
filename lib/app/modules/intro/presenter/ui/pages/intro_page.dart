import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forestinv_mobile/app/modules/intro/presenter/outputs/stores/intro_store.dart';
import 'package:forestinv_mobile/app/modules/intro/presenter/ui/components/build_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage();
  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  final IntroStore store = Modular.get();
  final controller = PageController();
  var isLastPage = false;

  @override
  void initState() {
    controller.dispose();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) => {
            setState(() => isLastPage = index == 3),
          },
          children: [
            BuildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/page1.jpg',
              title: 'Titulo',
              subtitle:
                  'Qualquer coisa ualquer coisa ualquer coisa ualquer coisa ualquer coisa ualquer coisa ualquer coisa ',
            ),
            BuildPage(
              color: Colors.blue.shade100,
              urlImage: 'assets/images/page2.jpg',
              title: 'Titulo',
              subtitle:
                  'Qualquer coisa ualquer coisa ualquer coisa ualquer coisa ualquer coisa ualquer coisa ualquer coisa ',
            ),
            Container(
              color: Colors.yellow,
              child: const Center(
                child: Text('Page 3'),
              ),
            ),
            Container(
              color: Colors.orange,
              child: const Center(
                child: Text('Page 4'),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(16),
                // ),
                primary: Colors.white,
                backgroundColor: Colors.teal.shade700,
                minimumSize: const Size.fromHeight(80),
              ),
              child: const Text(
                'Vamos comecar',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              onPressed: () async {
                store.savePrefsShowHomeIntro();
                store.goToLogin();
              },
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.jumpToPage(3),
                    child: const Text('PULAR'),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: const Text('PROXIMO'),
                  ),
                ],
              ),
            ),
    );
  }
}
