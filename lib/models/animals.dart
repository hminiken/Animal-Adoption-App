//DTO for animals

class Animals {
  String about;
  int age;
  bool disposition1;
  bool disposition2;
  bool disposition3;
  String email;
  String name;
  String phone;
  String sex;
  String url;
  bool favorite;
  String breed;

  Animals(
      {required this.about,
      required this.age,
      required this.disposition1,
      required this.disposition2,
      required this.disposition3,
      required this.email,
      required this.name,
      required this.phone,
      required this.sex,
      required this.url,
      required this.breed,
      required this.favorite});
}