import 'constants.dart';

List<double> electricityCost(double consumption) {
  double cost = 0.0;
  List<double> slices = [];

  for (var i = 0; i < PRICES.length - 1; i++) {
    var limit = CONSUMPTIONRANGES[CONSUMPTIONRANGES.length - (i + 1)];
    if (consumption > limit) {
      // cost += (consumption - limit) * PRICES[PRICES.length - (i + 1)];
      slices.add((consumption - limit) * PRICES[PRICES.length - (i + 1)]);
      consumption -= (consumption - limit);
    }
  }

  if (consumption > 0) {
    // cost += consumption * PRICES[0];
    slices.add(consumption * PRICES[0]);
  }

  return slices;
}
