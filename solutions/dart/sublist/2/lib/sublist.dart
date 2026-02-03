enum Classification { equal, sublist, superlist, unequal }

class Sublist {
  bool areEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  bool isSublist(List<int> large, List<int> small) {
    for (int i = 0; i <= large.length - small.length; i++) {
      if (large[i] == small.first) {
        var sub = large.sublist(i, i + small.length);
        if (areEquals(small, sub)) return true;
      }
    }
    return false;
  }

  Classification sublist(List<int> l1, List<int> l2) {
    if (areEquals(l1, l2)) return Classification.equal;
    if (l1.isEmpty) return Classification.sublist;
    if (l2.isEmpty) return Classification.superlist;
    if (l1.length < l2.length) {
      if (isSublist(l2, l1)) return Classification.sublist;
    }
    if (l1.length > l2.length) {
      if (isSublist(l1, l2)) return Classification.superlist;
    }
    return Classification.unequal;
  }
}
