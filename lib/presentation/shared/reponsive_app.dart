import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({
    required this.builder,
    this.designSize = const Size(414, 896),
    Key? key,
  }) : super(key: key);

  final Widget Function() builder;

  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (_, Orientation orientation) {
            if (constraints.maxWidth != 0) {
              ScreenUtil.init(
                context,
                designSize: designSize,
              );
              return Builder(
                builder: (context) {
                  if (orientation == Orientation.portrait) {
                    _rebuildChildren(context);
                  }
                  return builder();
                },
              );
            }
            return Container();
          },
        );
      },
    );
  }

  void _rebuildChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
