import 'package:flutter/material.dart';

mixin HomeConstants {
  static const needsToUpdateGrad = [
    Color(0xFF52F3F3),
    Color(0xFF52F3A5),
    Color(0xFF5262F3),
    Color(0xFF52D6F3),
  ];
  static const relativeRoot = "/";
  static const relativeCompassAndQrGuide = "/compass_and_qr_guide";
  static const relativeQrNavigationReminder = "/qr_navigation_reminder";
  static const relativeCompassAndStorageGuide = "/compass_and_storage_guide";
  static const relativeStorageGuide = "/storage_guide";
  static const relativeShortQrGuide = "/short_qr_guide";
  static const relativeQrAndStorageAdept = "/qr_and_storage_adept";
  static const relativeNeedsToUpdate = "/needs_to_update";

  static const root = "/home$relativeRoot";
  static const compassAndQrGuide = "/home$relativeCompassAndQrGuide";
  static const qrNavigationReminder = "/home$relativeQrNavigationReminder";
  static const compassAndStorageGuide = "/home$relativeCompassAndStorageGuide";
  static const storageGuide = "/home$relativeStorageGuide";
  static const shortQrGuide = "/home$relativeShortQrGuide";
  static const qrAndStorageAdept = "/home$relativeQrAndStorageAdept";
  static const needsToUpdate = "/home$relativeNeedsToUpdate";
}
