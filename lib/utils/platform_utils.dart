import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

/// Placeholder screens for remaining routes
/// These are basic implementations that can be expanded

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final String message;

  const PlaceholderScreen({
    required this.title,
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(message),
          ],
        ),
      ),
    );
  }
}

/// Platform detection helper
class PlatformHelper {
  static bool get isWeb => UniversalPlatform.isWeb;
  static bool get isAndroid => UniversalPlatform.isAndroid;
  static bool get isIOS => UniversalPlatform.isIOS;
  static bool get isWindows => UniversalPlatform.isWindows;
  static bool get isMacOS => UniversalPlatform.isMacOS;
  static bool get isLinux => UniversalPlatform.isLinux;
  static bool get isMobile => isAndroid || isIOS;
  static bool get isDesktop => isWindows || isMacOS || isLinux;
}

/// Responsive layout helper
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext, BoxConstraints) builder;

  const ResponsiveBuilder({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => builder(context, constraints),
    );
  }
}

/// Adaptive layout widget
class AdaptiveScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? drawer;

  const AdaptiveScaffold({
    required this.title,
    required this.body,
    this.actions,
    this.drawer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: body,
      drawer: PlatformHelper.isMobile ? drawer : null,
      endDrawer: PlatformHelper.isWeb ? drawer : null,
    );
  }
}

/// Safe area with platform detection
class AdaptiveSafeArea extends StatelessWidget {
  final Widget child;

  const AdaptiveSafeArea({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformHelper.isWeb) {
      return child;
    }
    return SafeArea(child: child);
  }
}
