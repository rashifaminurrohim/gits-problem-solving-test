int countDiff(String s, int left, int right) {
  if (left >= right) return 0;
  int diff = countDiff(s, left + 1, right - 1);
  return s[left] == s[right] ? diff : diff + 1;
}

bool isAllDigit(String s, int i) {
  if (i >= s.length) return true;
  if (s[i].compareTo('0') < 0 || s[i].compareTo('9') > 0) return false;
  return isAllDigit(s, i + 1);
}

String makePalindrome(String s, int left, int right) {
  if (left >= right) {
    return s;
  }
  String best = s[left].compareTo(s[right]) > 0 ? s[left] : s[right];
  String beforeLeft = s.substring(0, left);
  String bestLeft = best;
  String between = s.substring(left + 1, right);
  String bestRight = best;
  String afterRight = s.substring(right + 1);

  String newS = beforeLeft + bestLeft + between + bestRight + afterRight;
  return makePalindrome(newS, left + 1, right - 1);
}

String raiseToNine(
  String s,
  String palindrome,
  int left,
  int right,
  int remaining,
) {
  if (left > right) return palindrome;
  if (left == right) {
    if (remaining > 0 && palindrome[left] != '9') {
      return palindrome.substring(0, left) +
          '9' +
          palindrome.substring(left + 1);
    }
    return palindrome;
  }

  int cost;
  if (palindrome[left] == '9') {
    cost = 0;
  } else if (s[left] != s[right]) {
    cost = 1;
  } else {
    cost = 2;
  }

  if (cost > 0 && cost <= remaining) {
    String raised =
        palindrome.substring(0, left) +
        '9' +
        palindrome.substring(left + 1, right) +
        '9' +
        palindrome.substring(right + 1);
    return raiseToNine(s, raised, left + 1, right - 1, remaining - cost);
  }
  return raiseToNine(s, palindrome, left + 1, right - 1, remaining);
}

String highestPalindrome(String s, int k) {
  if (s.isEmpty || k < 0 || !isAllDigit(s, 0)) return "-1";
  int diff = countDiff(s, 0, s.length - 1);
  if (diff > k) return "-1";
  String palindrome = makePalindrome(s, 0, s.length - 1);
  return raiseToNine(s, palindrome, 0, s.length - 1, k - diff);
}

void main() {
  print(highestPalindrome("3943", 1));
  print(highestPalindrome("932239", 2));
}
