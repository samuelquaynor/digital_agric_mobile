import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../pages/article_view.dart';

/// News Card widget
class NewsCard extends StatelessWidget {
  /// Constructor
  const NewsCard({
    required this.news,
    super.key,
  });
  /// News Data
  final Article news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => ArticleView(
            article: news,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          //alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.3,
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(news.urlToImage ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    // stops: [2, 5],
                  )),
            ),
            Positioned(
              top: 140,
              bottom: 20,
              left: 20,
              right: 20,
              child: Text(
                news.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
                maxLines: 2,
              ),
            ),
            Positioned(
              left: 20,
              bottom: 10,
              child: Row(
                children: [
                  Text(
                    news.source.name ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    news.publishedAt.toString().substring(0, 10),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
