import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';



    return Scaffold(
      body: CustomScrollView(
          slivers: [
            _CustomAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([

                _PosterAndTitle(),

                _Overview(),
                _Overview(),
                _Overview(),

                CastingCards(),

                

              ]),
            ),
          ],
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle( fontSize: 16),
          )
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://placehold.co/300x400/png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://placehold.co/200x300/png'),
              height: 150,
            ),
          ),

          const SizedBox(width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title',style: TextStyle( fontSize: 20) ,overflow: TextOverflow.ellipsis,maxLines: 2,),
              Text('movie.origianlTitle', overflow: TextOverflow.ellipsis,),

              Row(
                children: [
                const Icon(Icons.star_border_outlined, size: 15, color: Colors.grey,),
                const SizedBox(width: 5,),
                Text('movie-voteAverage', style: Theme.of(context).textTheme.bodySmall,)
                ]
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Deserunt eiusmod minim consequat laboris voluptate reprehenderit ipsum enim ipsum pariatur consequat do ipsum. Laborum id est cillum amet exercitation proident ullamco dolor. Nostrud irure dolor nostrud velit excepteur velit dolor.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}