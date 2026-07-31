import 'package:flutter_riverpod/legacy.dart';

/// Whether push notifications are enabled (local UI state for now).
final notificationsEnabledProvider = StateProvider<bool>((ref) => true);

/// Whether conversation reminders are enabled (local UI state for now).
final conversationRemindersProvider = StateProvider<bool>((ref) => true);

/// Whether daily AI tips are enabled (local UI state for now).
final dailyAiTipsProvider = StateProvider<bool>((ref) => true);

/// Whether product updates are enabled (local UI state for now).
final productUpdatesProvider = StateProvider<bool>((ref) => false);

/// Whether marketing emails are enabled (local UI state for now).
final marketingEmailsProvider = StateProvider<bool>((ref) => false);
