import 'package:flutter/widgets.dart';

extension NextPageScrollExtension on ScrollNotification {
  /// new Method to identified user is Scrolling to the next page or not .
  /// use scrollDirection Parameter to identified which user scroll is going to next page .
  bool isScrollNextPage(AxisDirection scrollDirection) {
    return metrics.maxScrollExtent > 0 &&
        metrics.extentAfter == 0 &&
        metrics.axisDirection == scrollDirection;
  }
}
