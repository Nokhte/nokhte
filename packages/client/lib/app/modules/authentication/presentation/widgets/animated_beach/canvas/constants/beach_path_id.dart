import 'package:primala/app/core/canvas_widget_utils/generic_path_id.dart';
import 'package:primala/app/modules/authentication/presentation/widgets/animated_beach/canvas/constants/beach_items.dart';

class BeachPathId extends GenericPathId<BeachItems> {
  BeachPathId({
    required bool isInteractable,
    required int indexIdentifier,
    required BeachItems shapeTypes,
    required Function pathInformation,
    required Function fillInformation,
  }) : super(
          isInteractable: isInteractable,
          indexIdentifier: indexIdentifier,
          shapeTypes: shapeTypes,
          pathInformation: pathInformation,
          fillInformation: fillInformation,
        );
}
