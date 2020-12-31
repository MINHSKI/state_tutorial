import 'package:smtutorial/models/drink.dart';
import 'package:state_notifier/state_notifier.dart';

// TODO 2: Create a DrinkStateNotifier class that extends StateNotifier
// TODO 5: Define generic type of the StateNotifier (which is a <List<Drink>>)
class DrinkStateNotifier extends StateNotifier<List<Drink>> {
  // TODO 3: Create the super notification
  DrinkStateNotifier(state) : super(state ?? []);

  // TODO 4: Add the method to select a Drink
  void selectDrink(Drink drink, bool selected) {
    state = [
      for (final d in state)
        if (d.name == drink.name) Drink(d.name, selected) else d,
    ];
  }
}

//
//
// Practice #1 Setup Code Linting Rules
// Practice #2 Single Responsibility
// Practice #3 Read and Learn from the Flutter Repository
// Practice #4 Keep Widgets Short, Narrow and Concise
// Practice #5 Start your code with CI / CD in mind
// Practice #6 Do not Hard Code Styles into your widgets
// Practice #7 Plan before you code
