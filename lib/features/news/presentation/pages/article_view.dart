import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../../../../core/util/date_format.dart';
import '../widgets/article_header.dart';

/// Article View Page
class ArticleView extends StatelessWidget {
  /// Constructor
  const ArticleView({super.key, required this.article});

  /// Article Data
  final Article article;

  @override
  Widget build(BuildContext context) {
    const imageHeight = 350;
    final infoHeight = MediaQuery.of(context).size.height - imageHeight - 20;
    final theme = Theme.of(context);
    return Scaffold(
        body: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
          SliverPersistentHeader(
              delegate: ArticleHeader(
                  child: Stack(children: [
            Container(
              constraints: const BoxConstraints.expand(),
              child: ExtendedImage.network(
                article.urlToImage ?? '',
                filterQuality: FilterQuality.high,
                isAntiAlias: true,
                shape: BoxShape.rectangle,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black87,
                    Colors.black26,
                  ],
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints.expand(),
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 210,
                width: MediaQuery.of(context).size.width * .85,
                padding: const EdgeInsets.only(bottom: 45, left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormatter.toDayHourMinute(article.publishedAt ?? ''),
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      article.title ?? '',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'RozhaOne',
                        fontSize: 18,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(
                      height: 12.5,
                    ),
                    Text(
                      article.author ?? '',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints.expand(),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 65,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        icon: const Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    // Text(
                    //   (article. ?? '').capitalize(),
                    //   style: GoogleFonts.roboto(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 28,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    Container(
                      width: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 10,
                    padding: const EdgeInsets.only(bottom: 45),
                    child: OverflowBox(
                        maxHeight: 100,
                        child: Container(
                            height: 25,
                            decoration: BoxDecoration(
                                color: theme.backgroundColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)))))))
          ]))),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return SingleChildScrollView(
                child: SizedBox(
                    height: 400,
                    child: Stack(children: [
                      Container(
                          constraints: const BoxConstraints.expand(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          height: infoHeight,
                          child: Column(children: [
                            Container(
                                padding: const EdgeInsets.only(bottom: 15),
                                height: 50,
                                child: Row(children: [
                                  Flexible(
                                      child: Container(
                                          constraints:
                                              const BoxConstraints.expand(),
                                          alignment: Alignment.centerLeft,
                                          child: CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              color: theme.cardColor,
                                              child: Container(
                                                  height: 30,
                                                  width: 140,
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      textBaseline: TextBaseline
                                                          .alphabetic,
                                                      children: [
                                                        SizedBox(
                                                          height: 30,
                                                          child: Icon(
                                                            Icons.web_sharp,
                                                            size: 18,
                                                            color: theme
                                                                .backgroundColor,
                                                          ),
                                                        ),
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 3.5),
                                                            width: 80,
                                                            child: Text(
                                                                article.url ??
                                                                    '',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.roboto(
                                                                    height: 1,
                                                                    fontSize:
                                                                        12,
                                                                    color: theme
                                                                        .textTheme
                                                                        .bodySmall!
                                                                        .color)))
                                                      ])),
                                              onPressed: () {
                                                // if (article.url != null) {
                                                //   openURL(article.url!);
                                                // }
                                              }))),
                                  Flexible(
                                      child: Container(
                                          constraints:
                                              const BoxConstraints.expand(),
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Text(
                                              'source',
                                              style: GoogleFonts.lora(
                                                fontWeight: FontWeight.w500,
                                                color: theme
                                                    .textTheme.bodyLarge!.color,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(article.source.name ?? '',
                                                style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w500,
                                                ))
                                          ])))
                                ])),
                            const SizedBox(height: 5),
                            Text(article.content ?? 'Nothing to show here!',
                                style: GoogleFonts.lora(
                                    fontSize: 16,
                                    height: 1.35,
                                    color: theme.textTheme.bodyMedium!.color))
                          ])),
                      Container(
                          constraints: const BoxConstraints.expand(),
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                              height: 50,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Divider(
                                      color: theme.textTheme.bodyLarge!.color,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'All news belongs to ${article.source.name}.',
                                        style: GoogleFonts.lora(
                                            color: theme
                                                .textTheme.bodyMedium!.color))
                                  ])))
                    ])));
          }, childCount: 1))
        ]));
  }
}
