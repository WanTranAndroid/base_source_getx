import 'package:base_source_getx/app/config/theme.dart';
import 'package:base_source_getx/domain/entities/article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ArticleCell extends StatelessWidget {
  final Article article;

  const ArticleCell({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CachedNetworkImage(
              width: 120,
              memCacheHeight: 150,
              memCacheWidth: 150,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => const ColoredBox(
                color: Colors.grey,
              ),
              imageUrl: article.urlToImage ?? "",
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title ?? "",
                  maxLines: 2,
                  style: AppTextStyles.title,
                ),
                const Spacer(),
                Text(
                  article.author ?? "",
                  maxLines: 1,
                  style: AppTextStyles.body,
                ),
                Text(
                  Jiffy(article.publishedAt).yMMMMd,
                  maxLines: 1,
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
