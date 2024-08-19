import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseque/auth/models/jobTitle_item.dart';
import 'package:jobseque/auth/presentation/screens/work_country.dart';

class JobtitleScreen extends StatefulWidget {
  const JobtitleScreen({super.key});

  @override
  State<JobtitleScreen> createState() => _JobtitleScreenState();
}

List<String> pics = [
  'assets/Discord Logo.png',
  'assets/Twitter Logo.png',
  'assets/Twitter Logo.png',
  'assets/Discord Logo.png',
  'assets/Discord Logo.png',
  'assets/Twitter Logo.png',
];
List<String> texts = ['ux/ui', 'dev', 'designer', 'management', 'hr', 'illu'];

class _JobtitleScreenState extends State<JobtitleScreen> {
  @override
  void initState() {
    super.initState();
    press = false;
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const WorkCountry(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:
// SingleChildScrollView(
//         child:
          Container(
              alignment: Alignment.topCenter,
              height: size.height,
              child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: size.width * 0.88,
                      child: Text(
                        'What type of work are you interested in? ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.radley(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Colors.black),
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                      width: size.width * 0.88,
                      child: Text(
                        'Tell us what you’re interested in so we can customise the app for your needs.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.radley(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Colors.grey.shade600),
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 30, left: 30, top: 30),
                    height: size.height * 0.55,
                    child: GridView.builder(
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.5,
                          //  mainAxisExtent: size.height * 0.2,
                          crossAxisCount: 2,
                          mainAxisSpacing: 17,
                          crossAxisSpacing: 20,
                        ),

                        // mainAxisExtent: size.height > size.width
                        //     ? size.height <= 700
                        //         ? size.height * 0.5
                        //         : size.height * 0.4
                        //     : size.height <= 500
                        //         ? size.width * 0.5
                        //         : size.width * 0.3),
                        itemBuilder: ((context, index) {
                          return JobtiteItem(
                            pic: pics[index],
                            text: texts[index],
                          );
                        })),
                  )
                ],
              )),
      persistentFooterButtons: [
        Center(
          child: Container(
            height: size.height * 0.05,
            width: size.width * 0.7,
            margin: const EdgeInsets.all(6),
            child: ElevatedButton(
              style: const ButtonStyle(
                  textStyle: WidgetStatePropertyAll<TextStyle>(
                    TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  alignment: Alignment.center,
                  elevation: WidgetStatePropertyAll<double>(0),
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
