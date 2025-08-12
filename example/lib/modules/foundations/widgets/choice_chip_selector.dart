import 'package:flutter/material.dart';

/// One tab in the ChipPageView: a label + a lazily built page.
class ChipPageItem {
  final String label;
  final WidgetBuilder builder;

  const ChipPageItem({required this.label, required this.builder});

  /// Convenience for static children.
  factory ChipPageItem.child({required String label, required Widget child}) =>
      ChipPageItem(label: label, builder: (_) => child);
}

/// Optional builder to fully customize each chip.
/// Call [goTo] to jump/animate to that page.
typedef ChipBuilder =
    Widget Function(
      BuildContext context,
      int index,
      bool selected,
      VoidCallback goTo,
    );

/// A PageView with a horizontal row of chips as the selector.
/// - Pass a list of [ChipPageItem] with labels and page builders.
/// - Optionally provide your own [chipBuilder] to style chips.
/// - You can also inject a [PageController] (or use the internal one).
class ChipPageView extends StatefulWidget {
  const ChipPageView({
    super.key,
    required this.items,
    this.initialIndex = 0,
    this.controller,
    this.onIndexChanged,
    this.keepPagesAlive = true,
    this.chipsPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.chipSpacing = 8,
    this.scrollChips = true,
    this.chipBuilder,
    this.animateDuration = const Duration(milliseconds: 280),
    this.animateCurve = Curves.easeOutCubic,
    this.pagePhysics = const BouncingScrollPhysics(),
  }) : assert(items.length > 0, 'ChipPageView requires at least one item.');

  final List<ChipPageItem> items;
  final int initialIndex;
  final PageController? controller;
  final ValueChanged<int>? onIndexChanged;

  /// Keep each page alive to preserve internal state/scroll positions.
  final bool keepPagesAlive;

  /// Chip row customization
  final EdgeInsets chipsPadding;
  final double chipSpacing;
  final bool scrollChips;
  final ChipBuilder? chipBuilder;

  /// PageView behavior
  final Duration animateDuration;
  final Curve animateCurve;
  final ScrollPhysics? pagePhysics;

  @override
  State<ChipPageView> createState() => _ChipPageViewState();
}

class _ChipPageViewState extends State<ChipPageView> {
  late final PageController _controller =
      widget.controller ?? PageController(initialPage: widget.initialIndex);

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, widget.items.length - 1);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _goTo(int i) {
    if (i == _index) return;
    _controller.animateToPage(
      i,
      duration: widget.animateDuration,
      curve: widget.animateCurve,
    );
  }

  Widget _defaultChip(
    BuildContext context,
    int i,
    bool selected,
    VoidCallback go,
  ) {
    final scheme = Theme.of(context).colorScheme;
    return ChoiceChip(
      label: Text(widget.items[i].label),
      selected: selected,
      showCheckmark: false,
      onSelected: (_) => go(),
      selectedColor: scheme.primaryContainer,
      labelStyle: TextStyle(
        color: selected ? scheme.onPrimaryContainer : null,
        fontWeight: selected ? FontWeight.w600 : null,
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: selected ? Colors.transparent : scheme.outlineVariant,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buildChip = widget.chipBuilder ?? _defaultChip;

    return Column(
      children: [
        SizedBox(
          height: 56,
          child: widget.scrollChips
              ? ListView.separated(
                  padding: widget.chipsPadding,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.items.length,
                  separatorBuilder: (_, __) =>
                      SizedBox(width: widget.chipSpacing),
                  itemBuilder: (context, i) =>
                      buildChip(context, i, i == _index, () => _goTo(i)),
                )
              : Padding(
                  padding: widget.chipsPadding,
                  child: Wrap(
                    spacing: widget.chipSpacing,
                    children: List.generate(widget.items.length, (i) {
                      return buildChip(context, i, i == _index, () => _goTo(i));
                    }),
                  ),
                ),
        ),
        const Divider(height: 1),
        Expanded(
          child: PageView.builder(
            controller: _controller,
            physics: widget.pagePhysics,
            onPageChanged: (i) {
              setState(() => _index = i);
              widget.onIndexChanged?.call(i);
            },
            itemCount: widget.items.length,
            itemBuilder: (context, i) {
              final page = widget.items[i].builder(context);
              if (!widget.keepPagesAlive) return page;
              return _KeepAlive(key: PageStorageKey('cpv_$i'), child: page);
            },
          ),
        ),
      ],
    );
  }
}

class _KeepAlive extends StatefulWidget {
  const _KeepAlive({super.key, required this.child});
  final Widget child;

  @override
  State<_KeepAlive> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<_KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
