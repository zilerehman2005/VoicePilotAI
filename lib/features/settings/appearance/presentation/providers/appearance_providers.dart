import 'package:flutter_riverpod/legacy.dart';

/// Theme options selectable on the Appearance screen.
enum ThemeModeOption { system, dark, light }

/// Currently selected theme mode (local UI state for now).
final appearanceThemeModeProvider =
    StateProvider<ThemeModeOption>((ref) => ThemeModeOption.system);

/// Whether the "Use AMOLED Black" toggle is enabled (local UI state for now).
final amoledBlackProvider = StateProvider<bool>((ref) => true);

/// Whether the "Dynamic Colors" toggle is enabled (local UI state for now).
final dynamicColorsProvider = StateProvider<bool>((ref) => true);
