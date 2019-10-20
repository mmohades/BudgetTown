class Building {
  final String name;
  String get fileName => '';

  final bool isBusiness;
  final int hourlyIncome;
  DateTime lastTimeCollected;

  int get income =>
      DateTime.now().difference(lastTimeCollected).inHours * hourlyIncome;
  bool get canCollectIncome =>
      DateTime.now().difference(lastTimeCollected).inHours >= 1;

  Building(this.name, this.isBusiness, this.hourlyIncome);
}

class BuildindProvider {
  static final List<Building> buildings = [];

  static const List<String> imgNames = [
    'Airport',
    'Bank',
    'Bowling',
    'Coffee shop',
    'Condo',
    'Fire station',
    'Fountain',
    'Hospital',
    'House',
    'Museum',
    'Park',
    'Pizzeria',
    'Police station',
    'Pub',
    'School',
    'Skyscraper',
    'Supermarket',
    'Townhouse',
  ];
}
