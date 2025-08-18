import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class ActionSheetsComponentShowcase extends StatelessWidget {
  /// @no-doc
  const ActionSheetsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = {
      'Default': _DefaultActionSheet(),
      'Menu': _MenuActionSheet(),
      'Custom': _CustomBody(),
    };
    return ShowcaseCard(
      child: Column(
        spacing: FlowinDesignSpace.space300,
        children: stories.entries.map((entry) {
          return FDButton(
            label: entry.key,
            size: FDButtonSize.md,
            onPressed: () {
              showDefaultActionSheet(
                context: context,
                constraints: BoxConstraints(maxWidth: 400),
                builder: (_) => entry.value,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class _DefaultActionSheet extends StatelessWidget {
  const _DefaultActionSheet();

  @override
  Widget build(BuildContext context) {
    return FDActionSheet(
      headerIcon: _getHeaderIcon(context),
      onClose: () {
        context.popDefaultActionSheet();
      },
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
              icon: FDIcons.board.toIcon(size: FlowinDesignIconSize.sm),
              size: FDButtonSize.md,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomBody extends StatelessWidget {
  const _CustomBody();

  @override
  Widget build(BuildContext context) {
    return FDActionSheet(
      title: 'Share Score',
      onClose: () {
        context.popDefaultActionSheet();
      },
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
    );
  }
}

class _MenuActionSheet extends StatelessWidget {
  const _MenuActionSheet();

  @override
  Widget build(BuildContext context) {
    return FDActionSheet(
      title: 'Match Options',
      onClose: () {
        context.popDefaultActionSheet();
      },
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
            icon: FDIcons.restart.toIcon(size: FlowinDesignIconSize.sm),
            onPressed: () {},
          ),
          FDItemButton.destructive(
            label: 'Delete Match',
            icon: FDIcons.trash.toIcon(size: FlowinDesignIconSize.sm),
            onPressed: () {},
          ),
        ],
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

Widget _getHeaderIcon(BuildContext context) => FDIcons.scanFace.toIcon(
  size: FlowinDesignIconSize.xl,
  color: Theme.of(context).colorScheme.onSurfaceVariant,
);
