import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
export 'session_card_store.dart';
export 'session_card.dart';

class SessionCard extends HookWidget {
  final SessionCardStore store;
  final List<NokhteSessionArtifactEntity> sessions;
  const SessionCard({
    super.key,
    required this.sessions,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
    return Observer(
      builder: (context) {
        return AnimatedOpacity(
          opacity: useWidgetOpacity(store.showWidget),
          duration: Seconds.get(1),
          child: ListView.separated(
            physics: store.disableTouchInput
                ? const NeverScrollableScrollPhysics()
                : null,
            itemCount: sessions.length,
            addAutomaticKeepAlives: true,
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(height * .02),
              child: Container(),
            ),
            itemBuilder: (context, index) {
              return HookBuilder(builder: (context) {
                if (!store.hasBeenInitiallySet[index]) {
                  final newFocusNode = FocusNode();
                  final newController = TextEditingController();
                  store.focusNodes.add(newFocusNode);
                  store.textEditingControllers.add(newController);
                  newController.text = sessions[index].title;
                }
                return GestureDetector(
                  onTap: () => store.onTap(index),
                  onDoubleTap: () => store.onDoubleTap(index),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * .04),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2, color: Colors.white)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5.0),
                            child: Theme(
                              data: ThemeData(
                                textSelectionTheme:
                                    const TextSelectionThemeData(
                                  selectionColor:
                                      Color.fromARGB(255, 7, 190, 172),
                                ),
                              ),
                              child: TextFormField(
                                focusNode: store.focusNodes[index],
                                controller: store.textEditingControllers[index],
                                readOnly: store.isReadOnly,
                                onFieldSubmitted: (value) => store.onEdit(
                                    sessions[index].id, value, index),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.jost(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                onTap: () => store.onTap(index),
                                onTapOutside: (event) =>
                                    store.focusNodes[index].unfocus(),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "A memorable title",
                                  hintStyle: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white.withOpacity(.4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Jost(
                              " ${sessions[index].date}",
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        );
      },
    );
  }
}
