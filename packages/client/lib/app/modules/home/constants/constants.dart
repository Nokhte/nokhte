import 'package:flutter/material.dart';

mixin HomeConstants {
  static const needsToUpdateGrad = [
    Color(0xFF52F3F3),
    Color(0xFF52F3A5),
    Color(0xFF5262F3),
    Color(0xFF52D6F3),
  ];

  static const module = '/home';
  static const relativeRoot = "/";
  static const relativeCompassAndQrGuide = "/compass_and_qr_guide";
  static const relativeQrNavigationReminder = "/qr_navigation_reminder";
  static const relativeCompassAndStorageGuide = "/compass_and_storage_guide";
  static const relativeStorageGuide = "/storage_guide";
  static const relativeShortQrGuide = "/short_qr_guide";
  static const relativeQrAndStorageAdept = "/qr_and_storage_adept";
  static const relativeNeedsToUpdate = "/needs_to_update";

  static const root = "$module$relativeRoot";
  static const compassAndQrGuide = "$module$relativeCompassAndQrGuide";
  static const qrNavigationReminder = "$module$relativeQrNavigationReminder";
  static const compassAndStorageGuide =
      "$module$relativeCompassAndStorageGuide";
  static const storageGuide = "$module$relativeStorageGuide";
  static const shortQrGuide = "$module$relativeShortQrGuide";
  static const qrAndStorageAdept = "$module$relativeQrAndStorageAdept";
  static const needsToUpdate = "$module$relativeNeedsToUpdate";
}
