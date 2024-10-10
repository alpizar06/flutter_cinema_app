import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key, required this.popularMovies, this.sliderTitle});

  final List<Movie>popularMovies;
  final String? sliderTitle;

  @override
  Widget build(BuildContext context) {

    final size =  MediaQuery.of(context).size;

    if(this.popularMovies.length == 0){
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(sliderTitle != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(sliderTitle!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),  
            ),

          const SizedBox(height: 5,),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularMovies.length,
              itemBuilder: (_, int index) => _MoviePoster(movie: popularMovies[index]),
            ),
          ),
        ],
      ),
    );
  }
}


class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 130,
                  height: 190,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: ()=> Navigator.pushNamed(context, 'details',arguments: 'movie-instance'),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            placeholder: const AssetImage('assets/no-image.jpg'), 
                            image: NetworkImage(movie.fullPosterImg),
                            width: 130,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        movie.title,
                        maxLines: 2, 
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
  }
}