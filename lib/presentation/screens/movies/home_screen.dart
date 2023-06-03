import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayinMoviesProvider);

    // LOADING
    if (slideShowMovies.isEmpty) {
      return const Center(
          child: CircularProgressIndicator(backgroundColor: Colors.white));
    }

    return CustomScrollView(
      slivers: [
        // APP BAR que se esconde al hacer scroll hacia abajo y aparece al hacer scroll hacia arriba
        const SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: CustomAppbar(),
            )),
        // Listado de elementos que se pueden hacer scroll
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                // APPBAR
                // const CustomAppbar(),

                MoviesSlideshow(movies: slideShowMovies),

                // MOVIES HORIZONTAL LISTVIEW
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cartelera',
                  subTitle: 'Hoy',
                  loadNextPage: () {
                    ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Proximamente',
                  subTitle: 'Em este mes',
                  loadNextPage: () {
                    ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Polulares',
                  // subTitle: 'Em este mes',
                  loadNextPage: () {
                    ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Mejores calificadas',
                  subTitle: 'Siempre',
                  loadNextPage: () {
                    ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
                  },
                ),
                const SizedBox(height: 20),

                // Expanded(
                //   child: ListView.builder(
                //     itemCount: nowPlayingMovies.length,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         title: Text(nowPlayingMovies[index].title),
                //       );
                //     },
                //   ),
                // )
              ],
            );
          },
          childCount: 1,
        ))
      ],
    );
  }
}
