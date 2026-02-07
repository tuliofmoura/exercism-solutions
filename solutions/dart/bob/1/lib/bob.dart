const sure = 'Sure.';
const whoa = 'Whoa, chill out!';
const calm = 'Calm down, I know what I\'m doing!';
const fine = 'Fine. Be that way!';
const whatever = 'Whatever.';

class Bob {
  String response(String something) {
    final trimmedStr = something.trim();
    if (trimmedStr.isEmpty) {
      return fine;
    }
    if (isQuestion(trimmedStr)) {
      return replyQuestion(trimmedStr);
    }

    if (isShouting(trimmedStr)) {
      return whoa;
    }

    return whatever;
  }

  bool isQuestion(String str) => str.endsWith('?');

  bool isShouting(String str) =>
      str.toUpperCase() == str && str.contains(RegExp(r'[A-Z]'));

  String replyQuestion(String str) {
    if (isShouting(str)) return calm;
    return sure;
  }
}
