import 'package:example/shared/workbench/presentation/widgets/showcase_card.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';

/// @no-doc
class CardsComponentShowcase extends StatelessWidget {
  /// @no-doc
  const CardsComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      child: Column(
        spacing: FlowinDesignSpace.space400,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FDCard(
            size: Size.square(FlowinDesignSpace.space4000),
            cornerRadius: FlowinDesignRadius.radius800,
            child: Center(child: Text('Large')),
          ),
          FDCard(
            size: Size.square(FlowinDesignSpace.space2400),
            cornerRadius: FlowinDesignRadius.radius500,
            child: Center(child: Text('Small')),
          ),
        ],
      ),
    );
  }
}
