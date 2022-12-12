String greetings() {
  final hour = DateTime.now().hour;
  String greet = 'Hello 👋';

  if (hour < 12) {
    greet = 'Good morning 👋';
  } else if (hour >= 12 && hour <= 17) {
    greet = 'Good afternoon 👋';
  } else if (hour >= 18) {
    greet = 'Good night 👋';
  }

  return greet;
}
