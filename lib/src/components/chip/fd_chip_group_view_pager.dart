import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// One tab in the ChipGroupViewPager: a label + a lazily built page.
class FDChipGroupViewPage {
  /// @no-doc
  const FDChipGroupViewPage({required this.label, required this.builder});

  /// Convenience for static children.
  factory FDChipGroupViewPage.child({
    required String label,
    required Widget child,
  }) => FDChipGroupViewPage(label: label, builder: (_) => child);

  /// @no-doc
  final String label;

  /// @no-doc
  final WidgetBuilder builder;
}

/// Builds a *base* FdChip (unselected). The FdChipGroup will
/// handle selected/unselected variants & onTap wires.
typedef FdChipFactory = FdChip Function(BuildContext context, String label);

/// @no-doc
class FDChipGroupViewPager extends StatefulWidget {
  /// @no-doc
  const FDChipGroupViewPager({
    required this.items,
    this.chipFactory,
    this.initialIndex = 0,
    this.controller,
    this.onIndexChanged,
    this.keepPagesAlive = true,

    // Chip row customization (proxied to FdChipGroup)
    this.chipsPadding = const EdgeInsets.symmetric(
      horizontal: FlowinDesignSpace.space300,
    ),
    this.chipSpacing = FlowinDesignSpace.space200,
    this.scrollChips = true,
    this.unselectedVariant = FdChipVariant.unselected,
    this.chipGroupController,

    // PageView behavior
    this.animateDuration = const Duration(milliseconds: 280),
    this.animateCurve = Curves.easeOutCubic,
    this.pagePhysics = const BouncingScrollPhysics(),
    super.key,
  }) : assert(
         items.length > 0,
         'FDChipGroupViewPager requires at least one item.',
       );

  /// @no-doc
  final List<FDChipGroupViewPage> items;

  /// How to build the visual FdChip for each label.
  final FdChipFactory? chipFactory;

  /// Start selected page/chip.
  final int initialIndex;

  /// Optional external PageController (controlled mode).
  final PageController? controller;

  /// Optional external FdChipGroupController (controlled mode for chips).
  final FdChipGroupController? chipGroupController;

  /// @no-doc
  final ValueChanged<int>? onIndexChanged;

  /// Keep each page alive to preserve internal state/scroll positions.
  final bool keepPagesAlive;

  /// Chip row customization
  final EdgeInsets chipsPadding;

  /// @no-doc
  final double chipSpacing;

  /// @no-doc
  final bool scrollChips;

  /// @no-doc
  final FdChipVariant unselectedVariant;

  /// PageView behavior
  final Duration animateDuration;

  /// @no-doc
  final Curve animateCurve;

  /// @no-doc
  final ScrollPhysics? pagePhysics;

  @override
  State<FDChipGroupViewPager> createState() => _FDChipGroupViewPagerState();
}

class _FDChipGroupViewPagerState extends State<FDChipGroupViewPager> {
  late final PageController _pageController =
      widget.controller ?? PageController(initialPage: _clampedInitialIndex);

  late final bool _ownsChipController;
  late final FdChipGroupController _chipController;

  int _index = 0;

  int get _clampedInitialIndex =>
      widget.initialIndex.clamp(0, widget.items.length - 1);

  void _goTo(int i) {
    if (i == _index) return;
    _pageController.animateToPage(
      i,
      duration: widget.animateDuration,
      curve: widget.animateCurve,
    );
  }

  @override
  void initState() {
    super.initState();
    _index = _clampedInitialIndex;

    // Chip controller (controlled or uncontrolled)
    if (widget.chipGroupController == null) {
      _chipController = FdChipGroupController(initialIndex: _index);
      _ownsChipController = true;
    } else {
      _chipController = widget.chipGroupController!;
      _ownsChipController = false;
      // ensure external controller starts aligned
      _chipController.index = _index;
    }

    // If external PageController starts on a different page, sync chips.
    if (widget.controller != null) {
      _index = widget.controller!.initialPage;
      _chipController.index = _index;
    }
  }

  @override
  void didUpdateWidget(covariant FDChipGroupViewPager oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If item count shrank, clamp both controllers’ indices.
    final max = widget.items.length - 1;
    if (_index > max) {
      _index = max.clamp(0, max);
      _chipController.index = _index;
      _pageController.jumpToPage(_index);
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _pageController.dispose();
    }
    if (_ownsChipController) {
      _chipController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveChipFactory =
        widget.chipFactory ??
        (context, label) => FdChip(
          child: Text(label, style: Theme.of(context).textTheme.labelSmall),
        );

    final chips = widget.items
        .map((it) => effectiveChipFactory.call(context, it.label))
        .toList(growable: false);

    return Column(
      spacing: FlowinDesignSpace.space300,
      children: [
        FdChipGroup(
          chips: chips,
          controller: _chipController,
          unselectedVariant: widget.unselectedVariant,
          isScrollable: widget.scrollChips,
          padding: widget.chipsPadding,
          chipSpacing: widget.chipSpacing,
          onItemTap: (i, chip, scrollController) => _goTo(i),
        ),
        const FDDivider(),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            physics: widget.pagePhysics,
            onPageChanged: (i) {
              setState(() => _index = i);
              _chipController.index = i;
              widget.onIndexChanged?.call(i);
            },
            itemCount: widget.items.length,
            itemBuilder: (context, i) {
              final page = widget.items[i].builder(context);
              if (!widget.keepPagesAlive) return page;
              return _KeepAlive(
                key: PageStorageKey('chip_page_view_$i'),
                child: page,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _KeepAlive extends StatefulWidget {
  const _KeepAlive({
    required this.child,
    super.key,
  });
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
