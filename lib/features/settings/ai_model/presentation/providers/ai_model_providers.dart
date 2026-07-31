import 'package:flutter_riverpod/legacy.dart';

/// AI models selectable on the AI Model screen.
enum AiModel { gemma2b, phi3Mini, tinyLlama11b, mistral7b }

/// Display names for each selectable AI model.
const Map<AiModel, String> aiModelNames = {
  AiModel.gemma2b: 'Gemma 2B',
  AiModel.phi3Mini: 'Phi-3 Mini',
  AiModel.tinyLlama11b: 'TinyLlama 1.1B',
  AiModel.mistral7b: 'Mistral 7B',
};

/// Short descriptor lines for each selectable AI model.
const Map<AiModel, String> aiModelDescriptions = {
  AiModel.gemma2b: 'Fast and efficient',
  AiModel.phi3Mini: 'Lightweight and powerful',
  AiModel.tinyLlama11b: 'Very lightweight',
  AiModel.mistral7b: 'High performance',
};

/// Currently selected AI model (local UI state for now).
final selectedAiModelProvider = StateProvider<AiModel>((ref) => AiModel.gemma2b);

/// Selected temperature in a 0 - 1 range (local UI state for now).
final aiTemperatureProvider = StateProvider<double>((ref) => 0.5);
