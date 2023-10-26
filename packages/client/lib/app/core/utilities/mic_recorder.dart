/// mic_recorder.dart
/// Author: Picovoice Inc.

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_voice_processor/flutter_voice_processor.dart';
import 'package:leopard_flutter/leopard_error.dart';
import 'package:path_provider/path_provider.dart';

typedef RecordedCallback = Function(double length);
typedef ProcessErrorCallback = Function(LeopardException error);

class MicRecorder {
  final VoiceProcessor? _voiceProcessor;

  final int _frameLength = 512;
  final int _sampleRate;

  final List<int> _pcmData = [];

  static Future<MicRecorder> create(
      int sampleRate,
      RecordedCallback recordedCallback,
      ProcessErrorCallback processErrorCallback) async {
    return MicRecorder._(sampleRate, recordedCallback, processErrorCallback);
  }

  MicRecorder._(this._sampleRate, RecordedCallback recordedCallback,
      ProcessErrorCallback processErrorCallback)
      : _voiceProcessor = VoiceProcessor.instance {
    _voiceProcessor?.addFrameListener((frame) async {
      if (await _voiceProcessor?.isRecording() ?? false) {
        _pcmData.addAll(frame);
        recordedCallback(_pcmData.length / _sampleRate);
      }
    });
    _voiceProcessor?.addErrorListener((error) {
      processErrorCallback(LeopardException(error.message));
    });
  }

  Future<void> startRecord() async {
    if (await _voiceProcessor?.isRecording() ?? false) {
      return;
    }

    _pcmData.clear();

    if (await _voiceProcessor?.hasRecordAudioPermission() ?? false) {
      try {
        await _voiceProcessor?.start(_frameLength, _sampleRate);
      } on PlatformException catch (e) {
        throw LeopardRuntimeException(
            "Failed to start audio recording: ${e.message}");
      }
    } else {
      throw LeopardRuntimeException(
          "User did not give permission to record audio.");
    }
  }

  Future<File> stopRecord() async {
    if (await _voiceProcessor?.isRecording() ?? false) {
      try {
        await _voiceProcessor?.stop();
      } on PlatformException catch (e) {
        throw LeopardRuntimeException(
            "Failed to stop audio recording: ${e.message}");
      }
    }

    try {
      return await writeWavFile();
    } catch (e) {
      throw LeopardIOException("Failed to save recorded audio to file.");
    }
  }

  Future<File> writeWavFile() async {
    const int channelCount = 1;
    const int bitDepth = 16;

    final directory = await getApplicationDocumentsDirectory();
    final wavFile = File('${directory.path}/recording.wav');

    final bytesBuilder = BytesBuilder();

    void writeString(String s) {
      final stringBuffer = utf8.encode(s);
      bytesBuilder.add(stringBuffer);
    }

    void writeUint32(int value) {
      final uint32Buffer = Uint8List(4)
        ..buffer.asByteData().setUint32(0, value, Endian.little);
      bytesBuilder.add(uint32Buffer);
    }

    void writeUint16(int value) {
      final uint16Buffer = Uint8List(2)
        ..buffer.asByteData().setUint16(0, value, Endian.little);
      bytesBuilder.add(uint16Buffer);
    }

    void writeInt16(int value) {
      final int16Buffer = Uint8List(2)
        ..buffer.asByteData().setInt16(0, value, Endian.little);
      bytesBuilder.add(int16Buffer);
    }

    writeString('RIFF');
    writeUint32(((bitDepth / 8) * _pcmData.length + 36).toInt());
    writeString('WAVE');
    writeString('fmt ');
    writeUint32(16);
    writeUint16(1);
    writeUint16(channelCount);
    writeUint32(_sampleRate);
    writeUint32((_sampleRate * channelCount * bitDepth) ~/ 8);
    writeUint16((channelCount * bitDepth) ~/ 8);
    writeUint16(bitDepth);
    writeString('data');
    writeUint32(((bitDepth / 8) * _pcmData.length).toInt());

    for (int i = 0; i < _pcmData.length; i++) {
      writeInt16(_pcmData[i]);
    }

    return wavFile.writeAsBytes(bytesBuilder.toBytes());
  }
}
