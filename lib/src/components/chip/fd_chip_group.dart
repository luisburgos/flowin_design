import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// Simple controller to drive/read selection from the outside.
/// If you don't pass one to [FdChipGroup], it will create its own.
class FdChipGroupController extends ChangeNotifier {
  /// @no-doc
  FdChipGroupController({int initialIndex = 0})
    : _index = initialIndex.clamp(0, 1 << 30);

  int _index;

  /// @no-doc
  int get index => _index;

  /// @no-doc
  set index(int value) {
    if (_index == value) return;
    _index = value;
    notifyListeners();
  }
}

/// Chip Group:
/// - Controlled: pass a [controller] and update it from outside.
/// - Uncontrolled: omit [controller] and let the widget manage its own.
class FdChipGroup extends StatefulWidget {
  /// @no-doc
  const FdChipGroup({
    required this.chips,
    super.key,
    this.controller,
    this.initialSelectedIndex, // only used when controller is null
    this.unselectedVariant = FdChipVariant.unselected,
    this.onItemTap,
    this.height,
    this.isScrollable = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: FlowinDesignSpace.space300,
    ),
    this.chipSpacing = FlowinDesignSpace.space200,
  }) : assert(chips.length > 0, 'FdChipGroup requires at least one chip.');

  /// Rendered chips (their visual/style will be overridden by selection state).
  final List<FdChip> chips;

  /// Optional external controller (controlled mode).
  final FdChipGroupController? controller;

  /// Initial selected index when
  /// uncontrolled (ignored if [controller] provided).
  final int? initialSelectedIndex;

  /// Variant used for non-selected chips.
  final FdChipVariant unselectedVariant;

  /// Tap callback (fires after selection is applied).
  final void Function(int index, FdChip chip)? onItemTap;

  /// Layout options similar to your ChipPageView.
  final bool isScrollable;

  /// @no-doc
  final EdgeInsets padding;

  /// @no-doc
  final double? height;

  /// @no-doc
  final double chipSpacing;

  @override
  State<FdChipGroup> createState() => _FdChipGroupState();
}

class _FdChipGroupState extends State<FdChipGroup> {
  late final bool _ownsController;
  late FdChipGroupController _controller;

  void _updateState() {
    // Rebuild when selection changes.
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // If no controller provided, create one and keep ownership.
    if (widget.controller == null) {
      final initial = (widget.initialSelectedIndex ?? 0).clamp(
        0,
        widget.chips.length - 1,
      );
      _controller = FdChipGroupController(initialIndex: initial);
      _ownsController = true;
    } else {
      _controller = widget.controller!;
      _ownsController = false;
    }
    _controller.addListener(_updateState);
  }

  @override
  void didUpdateWidget(covariant FdChipGroup oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If the external controller instance changed, rewire the listener.
    if (oldWidget.controller != widget.controller) {
      _controller.removeListener(_updateState);

      if (widget.controller == null) {
        // Switch to owned controller (uncontrolled)
        final initial = (widget.initialSelectedIndex ?? _controller.index)
            .clamp(0, widget.chips.length - 1);
        _controller = FdChipGroupController(initialIndex: initial);
        _ownsController = true;
      } else {
        _controller = widget.controller!;
        _ownsController = false;
      }
      _controller.addListener(_updateState);
    }

    // Clamp current index if chips length changed.
    final maxIndex = widget.chips.length - 1;
    if (_controller.index > maxIndex) {
      _controller.index = maxIndex.clamp(0, maxIndex);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_updateState);
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildItemAt(int i) {
      final chip = widget.chips[i];
      final isSelected = i == _controller.index;

      return isSelected
          ? chip.copyWith(
              variant: FdChipVariant.selected,
              // Keep original onTap if you want toggle behavior;
              // otherwise null.
              onTap: chip.onTap,
            )
          : chip.copyWith(
              variant: widget.unselectedVariant,
              onTap: () {
                _controller.index = i;
                widget.onItemTap?.call(i, chip);
              },
            );
    }

    return SizedBox(
      height: widget.height ?? FlowinDesignSpace.space1200,
      child: widget.isScrollable
          ? ListView.separated(
              padding: widget.padding,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.chips.length,
              separatorBuilder: (context, index) => SizedBox(
                width: widget.chipSpacing,
              ),
              itemBuilder: (_, index) => buildItemAt(index),
            )
          : Padding(
              padding: widget.padding,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: widget.chipSpacing,
                children: List.generate(widget.chips.length, buildItemAt),
              ),
            ),
    );
  }
}
