enum Classification { equal, sublist, superlist, unequal }

class Sublist {
  bool areEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  Classification sublist(List<int> l1, List<int> l2) {
    if (areEquals(l1, l2)) return Classification.equal;
    if (l1.isEmpty) return Classification.sublist;
    if (l2.isEmpty) return Classification.superlist;
    if (l1.length < l2.length) {
      for (int i = 0; i < l2.length; i++) {
        if (l2[i] == l1.first) {
          var sub = l2.sublist(i, i + l1.length);
          if (areEquals(l1, sub)) return Classification.sublist;
        }
      }
    }
    if (l1.length > l2.length) {
      for (int i = 0; i < l1.length; i++) {
        if (l1[i] == l2.first) {
          var sub = l1.sublist(i, i + l2.length);
          if (areEquals(l2, sub)) return Classification.superlist;
        }
      }
    }
    return Classification.unequal;
  }
}
