import 'package:intl/intl.dart';

extension TimeDifference on DateTime {
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays == 0 && difference.inHours < 24) {
      if (difference.inHours == 0) {
        return "${difference.inMinutes} minutes ago";
      } else {
        return "${difference.inHours} hours ago";
      }
    } else if (difference.inDays == 1) {
      return "Yesterday";
    } else if (difference.inDays > 1 && difference.inDays <= 7) {
      return "${difference.inDays} days ago";
    } else {
      return DateFormat('MMMM d, y').format(this); // e.g., "May 16, 2024"
    }
  }
}
