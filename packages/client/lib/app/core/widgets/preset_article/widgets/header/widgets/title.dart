import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class ArticleTitle extends StatelessWidget {
  final String title;
  const ArticleTitle(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Jost(
              title,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
