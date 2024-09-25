// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/shared/mobx/mobx.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_starter_widgets_coordinator.g.dart';

class SessionStarterWidgetsCoordinator = _SessionStarterWidgetsCoordinatorBase
    with _$SessionStarterWidgetsCoordinator;

abstract class _SessionStarterWidgetsCoordinatorBase
    with
        Store,
        SwipeNavigationUtils,
        NokhteWidgetsUtils,
        BaseWidgetsCoordinator,
        Reactions,
        EnRoute,
        HomeNavigation {
  final SmartTextStore qrSubtitleSmartText;
  final PresetArticleStore presetArticle;
  // final PresetIconsStore presetIcons;
  final PresetHeaderStore presetHeader;
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final NokhteBlurStore nokhteBlur;
  final NokhteQrCodeStore qrCode;
  @override
  final CenterNokhteStore centerNokhte;
  @override
  final AuxiliaryNokhteStore homeNokhte;
  @override
  final SwipeGuideStore swipeGuide;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final SessionScrollerStore sessionScroller;
  final PresetCardsStore presetCards;
  final CondensedPresetCardsStore condensedPresetCards;
  final SmartTextStore headerText;
  @override
  final List<AuxiliaryNokhteStore> auxNokhtes;

  _SessionStarterWidgetsCoordinatorBase({
    required this.presetArticle,
    required this.beachWaves,
    required this.headerText,
    required this.presetHeader,
    required this.sessionScroller,
    required this.swipeGuide,
    required this.gestureCross,
    required this.presetCards,
    required this.qrSubtitleSmartText,
    required this.wifiDisconnectOverlay,
    required this.centerNokhte,
    required this.homeNokhte,
    required this.nokhteBlur,
    required this.qrCode,
  })  : condensedPresetCards = presetCards.condensed,
        auxNokhtes = [homeNokhte] {
    initSwipeNavigationUtils();
    initNokhteWidgetsUtils();
    initEnRouteActions();
    initBaseWidgetsCoordinatorActions();
    initBaseWidgetsCoordinatorActions();
  }

  @observable
  bool isEnteringNokhteSession = false;

  @observable
  bool firstCardIsSelected = false;

  @observable
  bool cardsHaveFadedIn = false;

  @observable
  bool hasNotSelectedPreset = false;

  @action
  setCardsHaveFadedIn(bool val) => cardsHaveFadedIn = val;

  @observable
  bool canHoldOnPresetCard = false;

  @action
  setCanHoldOnPresetCard(bool val) => canHoldOnPresetCard = val;

  @observable
  ObservableList<Widget> tags = ObservableList.of([]);

  @action
  constructor(Offset center) {
    qrCode.setWidgetVisibility(false);
    gestureCross.fadeInTheCross();
    centerNokhte.fadeIn();
    homeNokhte.setAndFadeIn(
      AuxiliaryNokhtePositions.bottom,
      AuxiliaryNokhteColorways.beachWave,
    );
    qrSubtitleSmartText.setMessagesData(SharedLists.emptyList);
    qrSubtitleSmartText.startRotatingText();
    qrSubtitleSmartText.setWidgetVisibility(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
    beachWaves.currentStore.initMovie(WaterDirection.down);
    headerText.setMessagesData(PresetsLists.presetsHeader);
    headerText.startRotatingText();
    initReactors();
  }

  @action
  onQrCodeReceived(String qrCodeData) {
    qrCode.setQrCodeData(qrCodeData);
    qrCode.setWidgetVisibility(true);
    if (qrCodeIsNotActivated) {
      qrSubtitleSmartText.setMessagesData(SessionStartersList.inactiveQrCode);
    } else {
      qrSubtitleSmartText.setMessagesData(SessionStartersList.activeQrCode);
    }

    qrSubtitleSmartText.setWidgetVisibility(true);
    qrSubtitleSmartText.startRotatingText(isResuming: true);
  }

  @action
  onNoPresetSelected() {
    onQrCodeReceived(SessionStarterConstants.inactiveQrCodeData);
    qrSubtitleSmartText.setMessagesData(SessionStartersList.inactiveQrCode);
    qrSubtitleSmartText.startRotatingText();
    hasNotSelectedPreset = true;
  }

  @action
  onPreferredPresetReceived({
    required String sessionName,
    required List tags,
    required String unifiedUID,
    required String userUID,
  }) {
    // qrSubtitleSmartText.startRotatingText();
    presetHeader.setHeader(
      sessionName,
      tags,
    );
    presetCards.setPreferredPresetUID(unifiedUID);
    onQrCodeReceived(userUID);
    // if (qrCodeIsNotActivated) {
    //   qrSubtitleSmartText.reset();
    //   qrSubtitleSmartText.setMessagesData(SessionStartersList.activeQrCode);
    //   qrSubtitleSmartText.startRotatingText();

    //   //
    // }
  }

  @action
  dismissExpandedPresetCard() {
    if (presetIsExpanded) {
      presetCards.dismissExpandedPresetCard();
      headerText.setWidgetVisibility(true);
      setCanHoldOnPresetCard(true);
    }
  }

  @action
  initExtraNavCleanUp() {
    qrSubtitleSmartText.setWidgetVisibility(false);
    presetHeader.setWidgetVisibility(false);
    // presetIcons.setWidgetVisibility(false);
    homeNokhte.setWidgetVisibility(false);
    centerNokhte.setWidgetVisibility(false);
    qrCode.setWidgetVisibility(false);
  }

  @action
  onSwipeDown(Function onLeaving) async {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        setSwipeDirection(GestureDirections.down);
        centerNokhte.initMovie(AuxiliaryNokhtePositions.bottom);
        // homeNokhte.disappear();
        swipeGuide.setWidgetVisibility(false);
        await onLeaving();
      }
    }
  }

  initReactors() {
    disposers.add(beachWavesReactor());
    disposers.add(qrSubtitleTextReactor());
    disposers.add(gestureCrossTapReactor());
    disposers.add(condensedPresetCardTapReactor());
    disposers.add(condensedPresetCardHoldReactor());
    disposers.add(transitionsCondensedPresetCardMovieStatusReactor());
    disposers.add(canScrollReactor());
    initHomeNavigationReactions();
  }

  qrSubtitleTextReactor() => reaction(
        (p0) => qrSubtitleSmartText.currentIndex,
        (p0) {
          if (beachWaves.movieMode == BeachWaveMovieModes.invertedOnShore &&
              qrSubtitleSmartText.showWidget) {
            if (p0 == 0) {
              qrSubtitleSmartText.startRotatingText(isResuming: true);
            } else if (p0 == 2) {
              qrSubtitleSmartText.setCurrentIndex(0);
              qrSubtitleSmartText.startRotatingText(isResuming: true);
            }
          }
        },
      );

  @action
  initTransition() {
    scrollToTop();
    presetHeader.presetIcons.setWidgetVisibility(false);
    isEnteringNokhteSession = true;
    setSwipeDirection(GestureDirections.up);
    beachWaves
        .setMovieMode(BeachWaveMovieModes.invertedOnShoreToInvertedDeepSea);
    beachWaves.currentStore.initMovie(beachWaves.currentAnimationValues.first);
    qrSubtitleSmartText.setWidgetVisibility(false);
    // presetIcons.setWidgetVisibility(false);
    gestureCross.fadeAllOut();
    // presetIcons.setWidgetVisibility(false);
    centerNokhte.setWidgetVisibility(false);
    homeNokhte.setWidgetVisibility(false);
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  dismissNokhte() {
    setSwipeDirection(GestureDirections.initial);
    // qrCode.setWidgetVisibility(false);
    centerNokhte.moveBackToCross(
      startingPosition: CenterNokhtePositions.center,
    );
    gestureCross.strokeCrossNokhte.setWidgetVisibility(true);
    moveOtherNokhtes(shouldExpand: false);
    nokhteBlur.reverse();
    beachWaves.currentStore.setControl(Control.mirror);
    setHasInitiatedBlur(false);
    delayedEnableTouchFeedback();
  }

  @action
  scrollToTop() {
    sessionScroller.scrollController.animateTo(
      0,
      duration: Seconds.get(1),
      curve: Curves.decelerate,
    );
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected &&
        isAllowedToMakeGesture() &&
        beachWaves.movieMode == BeachWaveMovieModes.invertedOnShore) {
      if (!hasInitiatedBlur && !hasSwiped()) {
        swipeGuide.fadeIn();
        setTouchIsDisabled(true);
        setSwipeDirection(GestureDirections.initial);
        setHasInitiatedBlur(true);
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        // qrCode.setWidgetVisibility(false);
        // gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        moveOtherNokhtes(shouldExpand: true);
        // gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        // gestureCross.gradientNokhte.setWidgetVisibility(false);
        // qrSubtitleSmartText.setWidgetVisibility(false);
        // presetIcons.setWidgetVisibility(false);
        centerNokhte.moveToCenter();
      } else if (hasInitiatedBlur && !hasSwiped()) {
        dismissNokhte();
        swipeGuide.setWidgetVisibility(false);
      }
    }
  }

  @action
  onTap(Offset offset) {
    if (isAllowedToMakeGesture() && hasInitiatedBlur) {
      dismissNokhte();
      setSwipeDirection(GestureDirections.initial);
      qrCode.setWidgetVisibility(false);
      centerNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.center,
      );
      gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
      homeNokhte.initMovie(
        NokhteScaleState.shrink,
      );
      nokhteBlur.reverse();
      beachWaves.currentStore.setControl(Control.mirror);
      setHasInitiatedBlur(false);
      delayedEnableTouchFeedback();
    }
  }

  onCompanyPresetsReceived({
    required ObservableList unifiedUIDs,
    required ObservableList tags,
    required ObservableList names,
  }) {
    presetCards.setPresets(
      unifiedUIDs: unifiedUIDs,
      tags: tags,
      names: names,
    );
    presetCards.showAllCondensedPresets(showTags: false);
  }

  moveOtherNokhtes({required bool shouldExpand}) {
    homeNokhte.initMovie(
        shouldExpand ? NokhteScaleState.enlarge : NokhteScaleState.shrink);
  }

  beachWavesReactor() => reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(SessionConstants.lobby, arguments: {
            SessionStarterConstants.QR_CODE_DATA: qrCode.qrCodeData,
          });
        }
      });

  transitionsCondensedPresetCardMovieStatusReactor() =>
      reaction((p0) => condensedPresetCards.movieStatuses.first, (p0) {
        if (p0 == MovieStatus.finished) {
          if (condensedPresetCards.movieModes.first ==
              CondensedPresetCardMovieModes.fadeIn) {
            if (!cardsHaveFadedIn) {
              condensedPresetCards.setCurrentHeldIndex(
                presetCards.preferredPresetIndex,
                override: true,
              );
              setCardsHaveFadedIn(true);
            }
          }
        }
      });

  presetSelectionReactor(Function(String param) onSelected) =>
      reaction((p0) => condensedPresetCards.movieStatuses.toString(),
          (p0) async {
        if (condensedPresetCards.currentHeldIndex != -1) {
          hasNotSelectedPreset = false;
          final currentHeldIndex = condensedPresetCards.currentHeldIndex;
          if (condensedPresetCards.movieModes[currentHeldIndex] ==
                  CondensedPresetCardMovieModes.selectionInProgress &&
              condensedPresetCards.movieStatuses[currentHeldIndex] ==
                  MovieStatus.finished) {
            if (firstCardIsSelected) {
              scrollToTop();
              // sessionScroller.scrollController.animateTo(
              //   0,
              //   duration: Seconds.get(1),
              //   curve: Curves.decelerate,
              // );

              // onSwipeLeft();
            }
            Timer(Seconds.get(1), () {
              condensedPresetCards.enableAllTouchFeedback();
            });
            Timer(Seconds.get(firstCardIsSelected ? 0 : 1), () {
              condensedPresetCards.initSelectionMovie(currentHeldIndex);
              firstCardIsSelected = true;
            });
            await onSelected(presetCards.currentlySelectedSessionUID);
          }
        }
      });
  condensedPresetCardTapReactor() =>
      reaction((p0) => presetCards.condensedTapCount, (p0) {
        presetArticle.showBottomSheet(
          presetCards.currentExpandedPresetType,
        );
      });

  condensedPresetCardHoldReactor() =>
      reaction((p0) => condensedPresetCards.currentHeldIndex, (p0) {
        if (condensedPresetCards.pastHeldIndex != -1) {
          condensedPresetCards.initWindDown(condensedPresetCards.pastHeldIndex);
        }
        if (hasNotSelectedPreset) {
          firstCardIsSelected = true;
        }
        presetCards.selectPreset(p0);
      });

  canScrollReactor() => reaction((p0) => canScroll, (p0) {
        sessionScroller.setCanScroll(p0);
      });

  @computed
  bool get canScroll =>
      !isEnteringNokhteSession &&
      !hasInitiatedBlur &&
      presetCards.activePresetType == ActivePresetType.condensed;

  @computed
  bool get qrCodeIsNotActivated =>
      qrCode.qrCodeData == SessionStarterConstants.inactiveQrCodeData;

  @computed
  bool get presetIsExpanded =>
      presetCards.activePresetType == ActivePresetType.expanded;
}
