// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors
import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/shared/mobx/mobx.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
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
  }) : auxNokhtes = [homeNokhte] {
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
  ObservableList tags = ObservableList.of([]);

  @action
  constructor() {
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
    required List<SessionTags> tags,
    required String presetUID,
    required String userUID,
  }) {
    presetHeader.setHeader(
      sessionName,
      tags,
    );
    presetCards.setPreferredPresetUID(presetUID);
    onQrCodeReceived(userUID);
  }

  @action
  initExtraNavCleanUp() {
    qrSubtitleSmartText.setWidgetVisibility(false);
    presetHeader.setWidgetVisibility(false);
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
    gestureCross.fadeAllOut();
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
        moveOtherNokhtes(shouldExpand: true);
        centerNokhte.moveToCenter();
      } else if (hasInitiatedBlur && !hasSwiped()) {
        dismissNokhte();
        swipeGuide.setWidgetVisibility(false);
      }
    }
  }

  @action
  onTap(offset) {
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

  onCompanyPresetsReceived(CompanyPresetsEntity presetsEntity) {
    presetCards.setPresets(presetsEntity);
    presetCards.showAllCondensedPresets();
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
      reaction((p0) => presetCards.movieStatuses.first, (p0) {
        if (p0 == MovieStatus.finished) {
          if (presetCards.movieModes.first ==
              CondensedPresetCardMovieModes.fadeIn) {
            if (!cardsHaveFadedIn) {
              presetCards.setCurrentHeldIndex(
                presetCards.preferredPresetIndex,
                override: true,
              );
              setCardsHaveFadedIn(true);
            }
          }
        }
      });

  presetSelectionReactor(Function(String param) onSelected) =>
      reaction((p0) => presetCards.movieStatuses.toString(), (p0) async {
        if (presetCards.currentHeldIndex != -1) {
          hasNotSelectedPreset = false;
          final currentHeldIndex = presetCards.currentHeldIndex;
          if (presetCards.movieModes[currentHeldIndex] ==
                  CondensedPresetCardMovieModes.selectionInProgress &&
              presetCards.movieStatuses[currentHeldIndex] ==
                  MovieStatus.finished) {
            if (firstCardIsSelected) {
              scrollToTop();
            }
            Timer(Seconds.get(1), () {
              presetCards.enableAllTouchFeedback();
            });
            Timer(Seconds.get(firstCardIsSelected ? 0 : 1), () {
              presetCards.initSelectionMovie(currentHeldIndex);
              firstCardIsSelected = true;
            });
            await onSelected(presetCards.currentlySelectedSessionUID);
          }
        }
      });
  condensedPresetCardTapReactor() =>
      reaction((p0) => presetCards.tapCount, (p0) {
        presetArticle.showBottomSheet(
          presetCards.companyPresetsEntity,
          activeIndex: presetCards.currentTappedIndex,
          onOpen: () {},
          onClose: () {},
        );
      });

  condensedPresetCardHoldReactor() =>
      reaction((p0) => presetCards.currentHeldIndex, (p0) {
        if (presetCards.pastHeldIndex != -1) {
          presetCards.initWindDown(presetCards.pastHeldIndex);
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
  bool get canScroll => !isEnteringNokhteSession && !hasInitiatedBlur;

  @computed
  bool get qrCodeIsNotActivated =>
      qrCode.qrCodeData == SessionStarterConstants.inactiveQrCodeData;
}
