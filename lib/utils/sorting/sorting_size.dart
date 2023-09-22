import 'dart:io';

class SortVideoBySize {
  static List<String> sortVideo(List<String> videoPaths, bool asce) {
    videoPaths.sort((a, b) {
      final File first = File(a);
      final File second = File(b);
      if (asce) {
        return first.lengthSync().compareTo(second.lengthSync());
      } else {
        return second.lengthSync().compareTo(first.lengthSync());
      }
    });
    return videoPaths;
  }
}
