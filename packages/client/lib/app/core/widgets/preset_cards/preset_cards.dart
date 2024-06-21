import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
export 'condensed/condensed_preset_cards.dart';
export 'expanded/expanded_preset_card.dart';
export 'preset_cards_store.dart';
export 'types/types.dart';
export 'icons/icons.dart';
export 'mixins/mixins.dart';

class PresetCards extends StatelessWidget {
  final PresetCardsStore store;
  const PresetCards({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MultiHitStack(
        children: [
          CondensedPresetsCards(
            names: store.names,
            tags: store.tags,
            unifiedUIDs: store.unifiedUIDs,
            store: store.condensed,
          ),
          ExpandedPresetsCards(
            store: store.expanded,
          ),
        ],
      );
    });
  }
}
