# Flutter Obfuscation Wrapper
-ignorewarnings
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.embedding.engine.** { *; }
-keep class io.flutter.embedding.android.** { *; }
-keep class io.flutter.embedding.engine.plugins.** { *; }
-keep class io.flutter.plugin.common.** { *; }
-keep class io.flutter.plugin.platform.** { *; }

# Keep custom model classes
-keep class com.google.firebase.** { *; }
-keep class androidx.lifecycle.DefaultLifecycleObserver

# To ignore minifyEnable: true error
-ignorewarnings
-keep class * {
    public private *;
}