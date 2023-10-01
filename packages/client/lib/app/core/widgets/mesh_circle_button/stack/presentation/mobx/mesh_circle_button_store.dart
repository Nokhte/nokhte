// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'mesh_circle_button_store.g.dart';

class MeshCircleButtonStore = _MeshCircleButtonStoreBase
    with _$MeshCircleButtonStore;

abstract class _MeshCircleButtonStoreBase extends Equatable with Store {
  @observable
  AnimatedMeshGradientController meshGradientController =
      AnimatedMeshGradientController();

  @observable
  bool isAnimating = false;

  @action
  widgetConstructor() {
    toggleWidgetVisibility();
    meshGradientController.stop();
  }

  @action
  toggleWidgetVisibility() {
    showWidget = !showWidget;
  }

  @observable
  bool showWidget = false;

  @observable
  Control control = Control.stop;

  @action
  toggleColorAnimation() {
    if (isAnimating) {
      meshGradientController.stop();
      isAnimating = false;
    } else {
      meshGradientController.start();
      isAnimating = true;
    }
  }

  @override
  List<Object> get props => [];
}
