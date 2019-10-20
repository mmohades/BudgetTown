class Building {
  final String name;
  String get fileName => '';

  final bool isBusiness;
  final int hourlyIncome;
  final int constructionCost;
  DateTime lastTimeCollected;

  int get income =>
      DateTime.now().difference(lastTimeCollected).inHours * hourlyIncome;
  bool get canCollectIncome =>
      DateTime.now().difference(lastTimeCollected).inHours >= 1;

  Building(
      this.name, this.constructionCost, this.isBusiness, this.hourlyIncome);
}

class Buildings {
  static final AIRPORT = Building("Airport", 800, true, 10);
  static final BANK = Building("Bank", 200, true, 5);
  static final BOWLING = Building("Bowling", 100, true, 5);
  static final Coffee_SHOP = Building("Coffee shop", 80, false, 2);
  static final CONDO = Building("Condo", 50, false, 0);
  static final FIRE_STATION = Building("Fire station", 30, false, 0);
  static final FOUNTAIN = Building("Fountain", 5, false, 0);
  static final HOSPITAL = Building("Hospital", 15, true, 1);
  static final HOUSE = Building("House", 10, false, 0);
  static final MUSEUM = Building("Museum", 20, true, 1);
  static final PARK = Building("Park", 5, false, 0);
  static final PIZZERIA = Building("Pizzeria", 15, true, 10);
  static final POLICE_STATION = Building("Police station", 20, false, 0);
  static final PUB = Building("Pub", 10, true, 5);
  static final SCHOOL = Building("School", 25, true, 5);
  static final SKY_SCRAPER = Building("Skyscraper", 120, false, 0);
  static final SUPERMARKET = Building("Supermarket", 15, true, 2);
  static final TWONHOUSE = Building("Townhouse", 90, false, 0);
}

class BuildingdProvider {
  static final List<Building> buildings = [];

  static List<Building> initBuildings() {
    if (buildings.length == 19) {
      return buildings;
    }

    buildings.clear();
    buildings.add(Buildings.AIRPORT);
    buildings.add(Buildings.BANK);
    buildings.add(Buildings.BOWLING);
    buildings.add(Buildings.Coffee_SHOP);
    buildings.add(Buildings.CONDO);
    buildings.add(Buildings.FIRE_STATION);
    buildings.add(Buildings.FOUNTAIN);
    buildings.add(Buildings.HOSPITAL);
    buildings.add(Buildings.HOUSE);
    buildings.add(Buildings.MUSEUM);
    buildings.add(Buildings.PARK);
    buildings.add(Buildings.PIZZERIA);
    buildings.add(Buildings.PUB);
    buildings.add(Buildings.SCHOOL);
    buildings.add(Buildings.SKY_SCRAPER);
    buildings.add(Buildings.SUPERMARKET);
    buildings.add(Buildings.TWONHOUSE);

    // buildings.add(Building("Airport", 800, true, 10));
    // buildings.add(Building("Bank", 200, true, 5));
    // buildings.add(Building("Bowling", 100, true, 5));
    // buildings.add(Building("Coffe shop", 80, false, 2));
    // buildings.add(Building("Condo", 50, false, 0));
    // buildings.add(Building("Fire station", 30, false, 0));
    // buildings.add(Building("Fountain", 5, false, 0));
    // buildings.add(Building("Hospital", 15, true, 1));
    // buildings.add(Building("House", 10, false, 0));
    // buildings.add(Building("Museum", 20, true, 1));
    // buildings.add(Building("Park", 5, false, 0));
    // buildings.add(Building("Pizzeria", 15, true, 10));
    // buildings.add(Building("Police station", 20, false, 0));
    // buildings.add(Building("Pub", 10, true, 5));
    // buildings.add(Building("School", 25, true, 5));
    // buildings.add(Building("Skyscraper", 120, false, 0));
    // buildings.add(Building("Supermarket", 15, true, 2));
    // buildings.add(Building("Townhouse", 90, false, 0));

    return buildings;
  }

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
