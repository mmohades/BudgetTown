import 'package:budget_town/shared/model/index.dart';

import 'model/building.dart';

class Global {
  static final User user = User(
      name: "Julia",
      id: "in71na6",
      coins: 1200,
      budget: 1200,
      profileImageName: 'User_Image.png',
      buildings: {
        1: Buildings.SCHOOL,
        2: Buildings.BOWLING,
        6: Buildings.SUPERMARKET
      });
}
