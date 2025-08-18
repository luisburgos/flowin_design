import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// @no-doc
class ButtonsComponentShowcase extends StatelessWidget {
  /// @no-doc
  const ButtonsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      child: FDChipGroupViewPager(
        items: [
          FDChipGroupViewPage(
            label: 'Default',
            builder: (context) {
              return Column(
                spacing: FlowinDesignSpace.space400,
                mainAxisAlignment: MainAxisAlignment.center,
                children: FDButtonVariant.values
                    .map(
                      (v) => _StoriesForVariant(v, (s) {
                        return FDButton(
                          icon: const Icon(LucideIcons.ship),
                          label: 'Label',
                          variant: v,
                          size: s,
                          onPressed: () {},
                        );
                      }),
                    )
                    .toList(),
              );
            },
          ),
          FDChipGroupViewPage(
            label: 'Custom: Loading',
            builder: (context) {
              return Column(
                spacing: FlowinDesignSpace.space400,
                mainAxisAlignment: MainAxisAlignment.center,
                children: FDButtonVariant.values
                    .map(
                      (v) => _StoriesForVariant(v, (s) {
                        final colors = getFDButtonVariantColors(
                          context,
                          variant: v,
                        );
                        return FDButton(
                          variant: v,
                          size: s,
                          child: SizedBox.square(
                            dimension: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              color: colors.foregroundColor,
                            ),
                          ),
                          onPressed: () {},
                        );
                      }),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StoriesForVariant extends StatelessWidget {
  const _StoriesForVariant(this.variant, this.builder);

  final FDButtonVariant variant;

  final Widget Function(FDButtonSize size) builder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: FlowinDesignSpace.space300,
      children: FDButtonSize.values.map((size) => builder(size)).toList(),
    );
  }
}
