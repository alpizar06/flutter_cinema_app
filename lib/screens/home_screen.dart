import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/providers/movies_provider.dart';
import 'package:flutter_cinema_app/search/search_delegate.dart';
import 'package:flutter_cinema_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(
              popularMovies: moviesProvider.popularMovies,
              sliderTitle: 'Populares!',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            
          ],
        ),
      ),
    );
  }
}