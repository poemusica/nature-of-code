class RuleSet {
  
  RuleSet() {
  }
  
  String applyRules(String sentence) {
    StringBuffer next = new StringBuffer();
    for (int i = 0; i < sentence.length(); i++) {
      char c = sentence.charAt(i);
      switch (c) {
        case 'F':
          next.append("FF+[+F-F-F]-[-F+F+F]");
          continue;
        default:
          next.append(c);
          continue;
      }
    }
    return next.toString();
  }
}
