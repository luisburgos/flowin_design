import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ActionSheetsComponentShowcase extends StatelessWidget {
  /// @no-doc
  const ActionSheetsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final headerIcon = FDIcons.scanFace.toIcon(
      size: FlowinDesignIconSize.xl,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    return ShowcaseCard(
      child: FDChipGroupViewPager(
        chipFactory: (context, label) => FdChip(
          child: Text(label, style: Theme.of(context).textTheme.labelSmall),
        ),
        items: [
          FDChipGroupViewPage(
            label: 'Default',
            builder: (_) => _StoryContainer(
              child: FDActionSheet(
                headerIcon: headerIcon,
                title: 'Descriptive Title',
                subtitle:
                    'Write something in here that gives clear '
                    'directions to the user',
                footer: Row(
                  spacing: FlowinDesignSpace.space300,
                  children: [
                    Expanded(
                      child: FDButton.tonal(
                        label: 'Label',
                        size: FDButtonSize.md,
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: FDButton(
                        label: 'Label',
                        icon: FDIcons.board.toIcon(
                          size: FlowinDesignIconSize.sm,
                        ),
                        size: FDButtonSize.md,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FDChipGroupViewPage(
            label: 'Time Out',
            builder: (_) => _StoryContainer(
              child: FDActionSheet(
                title: 'Time Out',
                body: _FakeBody('Team Selector'),
                footer: Row(
                  children: [
                    Expanded(
                      child: FDButton(
                        label: 'Add',
                        size: FDButtonSize.md,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FDChipGroupViewPage(
            label: 'Menu Items',
            builder: (_) => _StoryContainer(
              child: FDActionSheet(
                title: 'Match Options',
                body: Column(
                  spacing: FlowinDesignSpace.space300,
                  children: [
                    FDItemButton(
                      label: 'Customize Teams',
                      icon: FDIcons.paint.toIcon(size: FlowinDesignIconSize.sm),
                      onPressed: () {},
                    ),
                    FDItemButton(
                      label: 'Restart Match',
                      icon: FDIcons.restart.toIcon(
                        size: FlowinDesignIconSize.sm,
                      ),
                      onPressed: () {},
                    ),
                    FDItemButton.destructive(
                      label: 'Delete Match',
                      icon: FDIcons.trash.toIcon(size: FlowinDesignIconSize.sm),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          FDChipGroupViewPage(
            label: 'Custom Body',
            builder: (_) => _StoryContainer(
              child: FDActionSheet(
                title: 'Share Score',
                body: _FakeBody('Share Card'),
                footer: Row(
                  children: [
                    Expanded(
                      child: FDButton(
                        label: 'Share',
                        size: FDButtonSize.md,
                        icon: FDIcons.share.toIcon(),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
    return Center(
      child: ShowcaseCard(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        cornerRadius: FlowinDesignRadius.radius100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SizedBox(width: 300, child: child)],
        ),
      ),
    );
  }
}

class _FakeBody extends StatelessWidget {
  const _FakeBody(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FDCard(
      cornerRadius: FlowinDesignRadius.radius500,
      child: SizedBox(height: 200, child: Center(child: Text(text))),
    );
  }
}
