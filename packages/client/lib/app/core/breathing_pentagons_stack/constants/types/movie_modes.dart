/// movie_modes.dart
/// Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 30th 2023
///
/// Author: Sonny Vesali
///
/// The `MovieModes` enum defines the different 'movies' for the
/// `breathingPentagonsButton` widget. Each movie mode represents a specific
/// mode / type of animation for the button.
///
/// - In [aggressiveExpansion] In this mode, the button rotates, expands, and
///   changes colors.
/// - In [infiniteRotation] the button rests on the final color and
///   rotates indefinitely.
/// - In [windDown] the button decreases in size and rotates back to
///   the resting position. It provides a smooth transition effect after
///   the aggressive expansion.
/// - [idle] is the default mode of the button when it is not actively
///   animating. The button remains still without any animation.
///
/// The `MovieModes` enum is used to specify the animation behavior of the
/// `breathingPentagonsButton` widget, in the associated mobx store.
enum MovieModes {
  aggressiveExpansion,
  infiniteRotation,
  windDown,
  idle,
}
