import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){} 
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:const [
      
            CardSwiper(),
            MovieSlider(),
            
          ],
        ),
      ),
    );
  }
}