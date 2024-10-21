import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class MovieSearchDelegate extends SearchDelegate{

  @override
  String get searchFieldlabel => 'Buscar Película';
  @override

  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon:const  Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null), 
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  Widget _EmptyContainer(){
    return Container (
        child: const Center(
          child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 100),
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return _EmptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (_,AsyncSnapshot<List<Movie>> snapshot){
        if(!snapshot.hasData) return _EmptyContainer();
        
        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, int index) => _MovieItem(movie: movies[index])
        );
      },
    );
  }

}


class _MovieItem extends StatelessWidget {
  const _MovieItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {

    movie.heroid = 'search-${movie.id}';

    return Hero(
      tag: movie.heroid!,
      child: ListTile(
        leading: FadeInImage(
          placeholder:const AssetImage('assets/no-image.jpg'), 
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(movie.title),
        subtitle: Text(movie.originalTitle),
        onTap: () {
          Navigator.pushNamed(context, 'details',arguments: movie);
        },
      ),
    );
  }
}