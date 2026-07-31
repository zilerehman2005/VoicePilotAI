import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../shared/widgets/misc/section_header.dart';
import '../../../../../shared/widgets/navigation/top_app_bar.dart';
import '../../../voice_settings/presentation/widgets/labeled_slider.dart';
import '../providers/ai_model_providers.dart';
import '../widgets/model_option_card.dart';

/// AI Model selection screen with model cards and a temperature slider.
class AiModelPage extends ConsumerWidget {
  const AiModelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AiModel selectedModel = ref.watch(selectedAiModelProvider);
    final double temperature = ref.watch(aiTemperatureProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: TopAppBar(
        title: 'AI Model',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              children: [
                const _SectionLabel('Select Model'),
                for (final AiModel model in AiModel.values)
                  ModelOptionCard(
                    icon: _modelIcon(model),
                    name: aiModelNames[model]!,
                    description: aiModelDescriptions[model]!,
                    isSelected: model == selectedModel,
                    onTap: () =>
                        ref.read(selectedAiModelProvider.notifier).state = model,
                  ),
                const SizedBox(height: AppSpacing.md),
                LabeledSlider(
                  label: 'Temperature',
                  value: temperature,
                  showValue: true,
                  valueLabel: temperature.toStringAsFixed(1),
                  minLabel: '0',
                  midLabel: '0.5',
                  maxLabel: '1',
                  min: 0,
                  max: 1,
                  onChanged: (double value) =>
                      ref.read(aiTemperatureProvider.notifier).state = value,
                ),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _modelIcon(AiModel model) {
    switch (model) {
      case AiModel.gemma2b:
        return Icons.memory;
      case AiModel.phi3Mini:
        return Icons.developer_board;
      case AiModel.tinyLlama11b:
        return Icons.hardware;
      case AiModel.mistral7b:
        return Icons.dns;
    }
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xs,
      ),
      child: SectionHeader(title: title),
    );
  }
}
