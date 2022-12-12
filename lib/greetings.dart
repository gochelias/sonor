String greetings() {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Good morning 👋';
  } else if (hour > 12 && hour < 18) {
    return 'Good afternoon 👋';
  }
  return 'Good night 👋';
}
