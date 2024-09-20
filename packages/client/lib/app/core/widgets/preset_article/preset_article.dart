import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
export 'widgets/widgets.dart';
export 'movies/movies.dart';
export 'mobx/preset_article_store.dart';
export 'types/types.dart';

class PresetArticle extends HookWidget {
  final PresetArticleStore store;
  const PresetArticle({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      store.setBuildContext(context);
      return null;
    }, []);
    return NokhteBlur(
      store: store.nokhteBlur,
    );
  }
}
