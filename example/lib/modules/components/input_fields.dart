import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

class InputFieldsComponentShowcase extends StatelessWidget {
  const InputFieldsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      child: FDChipGroupViewPager(
        items: [
          FDChipGroupViewPage(
            label: 'Text',
            builder: (_) => _StoryContainer(child: _TextFields()),
          ),
          FDChipGroupViewPage(
            label: 'Color',
            builder: (_) => _StoryContainer(child: FDColorPickerField()),
          ),
        ],
      ),
    );
  }
}

class _StoryContainer extends StatelessWidget {
  const _StoryContainer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: child,
        ),
      ],
    );
  }
}

class _TextFields extends StatelessWidget {
  const _TextFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: FlowinDesignSpace.space400,
      children: [
        FDTextField(
          id: 'name-empty',
          label: 'Name',
          onChanged: (value) {},
          hintText: 'Enter team name',
        ),
        FDTextField(
          id: 'name-home',
          label: 'Name',
          onChanged: (value) {},
          initialValue: 'HOME',
          hintText: 'Enter team name',
        ),
        FDTextField(
          id: 'name-focused',
          label: 'Name',
          onChanged: (value) {},
          initialValue: 'SPIKERS',
          hintText: 'Enter team name',
          autofocus: true,
        ),
      ],
    );
  }
}
