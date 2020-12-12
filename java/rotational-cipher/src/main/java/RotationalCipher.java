import java.util.stream.Collector;

class RotationalCipher {
  private int shiftKey;

  RotationalCipher(int shiftKey) {
    this.shiftKey = shiftKey;

  }

  String rotate(String data) {
    return data.codePoints().mapToObj(c -> {
      if (c >= 'a' && c <= 'z') {
        return (char) ('a' + (c + shiftKey - 'a') % ('z' - 'a' + 1));

      } else if (c >= 'A' && c <= 'Z') {
        return (char) ('A' + (c + shiftKey - 'A') % ('Z' - 'A' + 1));

      } else {
        return (char) c;
      }
    }).collect(Collector.of(StringBuilder::new, StringBuilder::append, StringBuilder::append, StringBuilder::toString));
  }

}
