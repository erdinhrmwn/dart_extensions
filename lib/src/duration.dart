part of '/dart_extensions.dart';

extension DurationExt on Duration {
  /// Utility to delay some callback (or code execution).
  ///
  /// Sample:
  /// ```
  ///   await 3.seconds.delay(() {
  ///       print('code will execute after 3 seconds');
  ///   }
  ///
  ///```
  Future delay([FutureOr callback()?]) async => Future.delayed(this, callback);

  /// Utility to create interval with callback (or code execution).
  ///
  /// Sample:
  /// ```
  ///   3.seconds.interval(() {
  ///       print('code will execute every 3 seconds');
  ///   }
  ///
  ///```
  Timer interval(void Function(Timer timer) callback) => Timer.periodic(this, callback);

  /// Utility to create timer with callback (or code execution).
  ///
  /// Sample:
  /// ```
  ///   3.seconds.timer(() {
  ///       print('code will execute after 3 seconds');
  ///   }
  ///
  ///```
  Timer timer(void Function() onDone) => Timer.periodic(Duration(seconds: 1), (timer) {
        if (timer.tick == inSeconds) {
          timer.cancel();
          onDone();
        }
      });

  static const int daysPerWeek = 7;
  static const int nanosecondsPerMicrosecond = 1000;

  /// Returns the representation in weeks
  int get inWeeks => (inDays / daysPerWeek).ceil();

  /// Adds the Duration to the current DateTime and returns a DateTime in the future
  DateTime get fromNow => DateTime.now().add(this);

  /// Subtracts the Duration from the current DateTime and returns a DateTime in the past
  DateTime get ago => DateTime.now().subtract(this);

  /// Adds this Duration and Duration and returns the sum as a new Duration object.
  Duration operator +(Duration duration) => Duration(microseconds: ((duration.inMilliseconds + this.inMilliseconds) * 1000).round());

  /// Subtracts the Duration from this Duration returns the difference as a new Duration object.
  Duration operator -(Duration duration) => Duration(microseconds: ((duration.inMilliseconds - this.inMilliseconds) * 1000).round());
}
