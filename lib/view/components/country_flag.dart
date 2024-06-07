class CountryAndFlag {
  String countryName;
  String countryFlag;
  List<StateAndCities>? stateAndCities;
  CountryAndFlag({required this.countryFlag, required this.countryName, this.stateAndCities});
}

class StateAndCities {
  String state;
  List<String> city;
  StateAndCities({
    required this.state,
    required this.city,
  });
}
