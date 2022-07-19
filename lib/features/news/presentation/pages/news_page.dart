import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/news_bloc.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(
          FetchNewsFromRepoEvent(),
        );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.file_download),
          color: Colors.green.shade900,
        ),
        title: Text(
          'News',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<NewsBloc, NewsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is NewsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsLoadedState) {
              return ListView.builder(
                itemCount: state.newsList.length,
                itemBuilder: (context, index) =>
                    NewsCard(news: state.newsList[index]),
              );
            } else if (state is NewsErrorState) {
              return Center(
                child: Text(state.errorMessage.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
