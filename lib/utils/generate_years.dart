List<String> generateYears(int startYear, int endYear) {
  List<String> years = [];

  for (int year = startYear; year <= endYear; year++) {
    years.add(year.toString());
  }

  return years;
}
