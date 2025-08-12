import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// @no-doc
class EasyAppVersion extends StatelessWidget {
  /// @no-doc
  const EasyAppVersion({this.builder, this.withBuildNumber = true, super.key});

  /// @no-doc
  final bool withBuildNumber;

  /// @no-doc
  final Widget Function(String)? builder;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.captionMedium.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    return FutureBuilder(
      future: EasyAppVersionReader.getVersion(withBuildNumber: withBuildNumber),
      builder: (context, snapshot) {
        debugPrint(
          'EasyAppVersion.connectionState: ${snapshot.connectionState}'
          ', data: ${snapshot.data}'
          ', error: ${snapshot.error}',
        );
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          final version = snapshot.data!;
          if (builder != null) {
            return builder!.call(version);
          }

          return SelectableText('v$version', style: textStyle);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

/// @no-doc
class EasyAppVersionReader {
  /// @no-doc
  static Future<String> getVersion({bool withBuildNumber = true}) async {
    final packageInfo = await PackageInfo.fromPlatform();
    var currentVersion = packageInfo.version;
    if (withBuildNumber) {
      final buildNumber = packageInfo.buildNumber;
      currentVersion += '+$buildNumber';
    }
    return currentVersion;
  }
}
