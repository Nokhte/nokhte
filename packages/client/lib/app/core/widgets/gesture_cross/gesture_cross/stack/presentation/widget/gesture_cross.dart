import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class GestureCross extends StatelessWidget {
  final Size size;
  final GestureCrossStore store;
  const GestureCross({
    super.key,
    required this.store,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.topLeft,
              width: size.width,
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox.expand(
                  child: MultiHitStack(
                    children: [
                      Cross(
                        size: size,
                        store: store.cross,
                      ),
                      CenterCrossNokhte(
                        store: store.centerCrossNokhte,
                      ),
                      GradientCrossNokhte(
                        offsets: [CircleOffsets.top],
                        store: store.gradientNokhte,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
        ],
      ),
    );
  }
}
