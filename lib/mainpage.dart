import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_movie/welcomepage.dart';
import 'package:uts_movie/widgets/toprated_widget.dart';
import 'package:uts_movie/widgets/trending_widget.dart';
import 'package:uts_movie/widgets/upcoming_widget.dart';

import 'api/api.dart';
import 'models/movies.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<Movies>> trendingMovies;
  late Future<List<Movies>> topRatedMovie;
  late Future<List<Movies>> upComingMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = Api().getTrendingWidget();
    topRatedMovie = Api().getTopRatedMovie();
    upComingMovies = Api().getUpComingWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (contex) => const WelcomePage()));
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.red,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => const WelcomePage()));
                },
                child: Icon(
                  Icons.logout_outlined,
                  color: Colors.redAccent[700],
                  size: 38,
                ),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
            height: 80,
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.outfit(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingWidget(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Top Rated Movies',
                style: GoogleFonts.outfit(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 18),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TopRatedMovie(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Upcoming Movies',
                style: GoogleFonts.outfit(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 18),
              SizedBox(
                child: FutureBuilder(
                  future: upComingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return UpComingWidget(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
