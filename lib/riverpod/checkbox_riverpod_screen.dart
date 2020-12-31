import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/riverpod/drink_state_notifier.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

// TODO 5: Create a final variable with a StateNotifierProvider
final drinksProvider = StateNotifierProvider(
  (ref) => DrinkStateNotifier(
    [
      // TODO 6: Initialize the DrinkStateNotifier with a List of drinks
      // TODO 7: Initialize a allDrinks variable
      Drink("Water", false),
      Drink("Cuba Libre", false),
      Drink("Pina Colada", false),
      Drink("Havana Cola", false),
    ],
  ),
);

final selectedProvider = Provider<List<Drink>>((ref) {
  // TODO 8: Use a basic Provider to receive the selectedDrinks
  return ref
      .watch(drinksProvider.state)
      .where((element) => element.selected)
      .toList();
});

// TODO 9: Change StatelessWidget to a ConsumerWidget
class CheckboxRiverpodScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // TODO 10: Add both providers and read the values
    List<Drink> allDrinks = watch(drinksProvider.state);
    List<Drink> selectedDrinks = watch(selectedProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Order"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              child: Column(children: [
                Text(
                  "Drinks tonight",
                  style: Theme.of(context).textTheme.headline4,
                ),
                // TODO 10: Write a for loop to access all drinks via read of the computed function
                for (final d in allDrinks)
                  DrinksWidget(
                    drink: Drink(d.name, d.selected),
                    onChanged: (bool value) {
                      context.read(drinksProvider).selectDrink(d, value);
                      // TODO 11: Access the drinksProvider.read and selectDrink
                    },
                  ),
                Text(
                  "The order is: ",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Consumer(
                          // TODO 12: read drinksProvider and get the selectedDrinks
                          builder: (context, watch, child) => Text(
                            watch(selectedProvider)[index].name,
                          ),
                        ),
                      );
                    },
                    // TODO 13: use the read drinksProvider to receive the selectedDrinks
                    itemCount: selectedDrinks.length,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
