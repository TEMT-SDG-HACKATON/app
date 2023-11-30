enum HomeViewEnum {
  dashboard(0, 'Home'),
  savings(1, 'Save'),
  investment(2, 'Invest'),
  profile(3, 'Profile');

  const HomeViewEnum(this.ind, this.name);

  final int ind;
  final String name;
}
