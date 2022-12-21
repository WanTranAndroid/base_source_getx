import 'package:base_source_getx/app/config/theme.dart';
import 'package:base_source_getx/domain/entities/article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Article article;

  const DetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Detail'),
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Text(
                article.title ?? "",
                style: AppTextStyles.title,
              ),
              const SizedBox(
                height: 10,
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
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
              const SizedBox(
                height: 10,
              ),
              Text(
                article.content ?? "",
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
