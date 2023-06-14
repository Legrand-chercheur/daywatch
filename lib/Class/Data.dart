
class Film_Avenir_And_Nouveau {
  late String id;
  late String nom_film;
  late String image_film;
  late String fichier_film;
  late String description;
  late String date_ajout;

  Film_Avenir_And_Nouveau(this.id, this.nom_film, this.image_film, this.fichier_film, this.description, this.date_ajout);

  Film_Avenir_And_Nouveau.fromjson(Map<String, dynamic> json){
    id = json['id'];
    nom_film = json['nom_film'];
    image_film = json['image_film'];
    fichier_film = json['fichier_film'];
    description = json['description'];
    date_ajout = json['date_ajout'];
  }
}

class Serie_Avenir_And_Nouveau {
  late String id;
  late String nom_film;
  late String image_film;
  late String fichier_film;
  late String description;
  late String date_ajout;

  Serie_Avenir_And_Nouveau(this.id, this.nom_film, this.image_film, this.fichier_film, this.description, this.date_ajout);

  Serie_Avenir_And_Nouveau.fromjson(Map<String, dynamic> json){
    id = json['id'];
    nom_film = json['nom_film'];
    image_film = json['image_film'];
    fichier_film = json['fichier_film'];
    description = json['description'];
    date_ajout = json['date_ajout'];
  }
}