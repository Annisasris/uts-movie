import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_movie/mainpage.dart';
import '../widgets/widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                Expanded(
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        Text(
                          'Dibangun oleh',
                          style: GoogleFonts.outfit(
                              fontSize: 28, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Annisa Sri Syabaniah',
                          style: GoogleFonts.outfit(
                              fontSize: 28, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'NPM 23552011410',
                          style: GoogleFonts.outfit(
                              fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => const MainPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent[700],
                      fixedSize: const Size(350, 50),
                    ),
                    child: Text(
                      'Mulai',
                      style:
                          GoogleFonts.outfit(fontSize: 18, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
