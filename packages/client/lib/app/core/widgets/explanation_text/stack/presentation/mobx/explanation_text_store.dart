// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
// * Equatable Import
import 'package:nokhte/app/core/widgets/text_editors/shared/shared.dart';
// * Mobx Codegen Inclusion
part 'explanation_text_store.g.dart';

class ExplanationTextStore = _ExplanationTextStoreBase
    with _$ExplanationTextStore;

abstract class _ExplanationTextStoreBase extends BaseTextEditorStore
    with Store {
  @observable
  bool showWidget = false;

  @action
  widgetConstructor() =>
      Future.delayed(Seconds.get(1), () => toggleWidgetVisibility());

  @action
  toggleWidgetVisibility() => showWidget = !showWidget;

  @override
  List<Object> get props => [
// some items
      ];
}
