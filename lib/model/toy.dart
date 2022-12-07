class Toy {
  // les propriétés d'un Toy
  final String toyId;
  final String name;
  final String img;
  final String description;
  final String price;
  final String ref;
  final String age;
  final String nbPlayers;
  final String timing;
  final String video;

 Toy({required this.toyId,required this.name, required this.img, required this.age,required this.ref,
  required this.price,required this.timing, required this.video, required this.description, required this.nbPlayers
  });

  factory Toy.fromJson(Map<String, dynamic> json){
    final id = (json['id']).toString();
    final name = (json['name'] == null) ? "name" : json["name"];
    final img = (json['img'] == null) ? "img" : json["img"];
    final price = (json['price'] == null) ? "price" : json["price"];
    final description = (json['description'] == null) ? "description" : json["description"];
    final ref = (json['ref'] == null) ? "ref" : json["ref"];
    final age = (json['age'] == null) ? "age" : json["age"];
    final nbPlayers = (json['nbPlayers'] == null) ? "nbPlayers" : json["nbPlayers"];
    final timing = (json['timing'] == null) ? "timing" : json["timing"];
    final video = (json['video'] == null) ? "video" : json["video"];

    return Toy(toyId: id, name: name, img: img, age: age, ref: ref, price: price, timing: timing, video: video, description: description, nbPlayers: nbPlayers);
  }
}