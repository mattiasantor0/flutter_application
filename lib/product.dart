class Product {
  final String codice;
  final String descrizione;
  final String id;
  final num giacenza;
  final String impegnato;
  final num disponibilita;
  final String ordinato;

  const Product({
    required this.codice,
    required this.id,
    required this.descrizione,
    required this.giacenza,
    required this.impegnato,
    required this.disponibilita,
    required this.ordinato,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      codice: json['codice'],
      descrizione: json['descrizione'],
      id: json['ID'],
      giacenza: json['giacenza'],
      impegnato: json['impegnato'],
      disponibilita: json['disponibilita'],
      ordinato: json['ordinato'],
    );
  }


  Map<String, dynamic> toJson() =>{
    "codice": codice,
    "descrizione":descrizione,
    "id":id,
    "giacenza":giacenza,
    "impegnato":impegnato,
    "disponibilita":disponibilita,
    "ordinato":ordinato
  };
}
