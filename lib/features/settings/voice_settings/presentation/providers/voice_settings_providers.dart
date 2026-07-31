import 'package:flutter_riverpod/legacy.dart';

/// Languages selectable for voice output.
enum VoiceLanguage { english, urdu }

/// Genders selectable for the assistant voice.
enum VoiceGender { female, male }

/// Selected voice language (local UI state for now).
final voiceLanguageProvider =
    StateProvider<VoiceLanguage>((ref) => VoiceLanguage.english);

/// Selected voice speed in a 0.5 - 1.5 range (1.0 = normal).
final voiceSpeedProvider = StateProvider<double>((ref) => 1.0);

/// Selected voice pitch in a 0.5 - 1.5 range (1.0 = normal).
final voicePitchProvider = StateProvider<double>((ref) => 1.0);

/// Selected voice gender (local UI state for now).
final voiceGenderProvider =
    StateProvider<VoiceGender>((ref) => VoiceGender.female);
