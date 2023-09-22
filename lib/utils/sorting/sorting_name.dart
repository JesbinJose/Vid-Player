class SortListByName {
  static List<String> sortVideos(List<String> videoPaths, bool asce) {
    // Sort the copied list in ascending order
      videoPaths.sort((a, b) {
        final String first = a.split('/').last;
        final String second = b.split('/').last;
        if (asce) {
          return first.compareTo(second);
        } else {
          return second.compareTo(first);
        }
      });
    return videoPaths;
  }
}
