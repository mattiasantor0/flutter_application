class PickingList{
  final String idLista;
  final String codice;
  final String descrizione;
  final String quantita;
  final String repartoDescrizione;
  final String ripiano;
  final String repartoCodice;

  const PickingList({
  required this.idLista, 
  required this.codice, 
  required this.descrizione, 
  required this.quantita, 
  required this.repartoDescrizione, 
  required this.ripiano,
  required this.repartoCodice
  });



  factory PickingList.fromJson(Map<String, dynamic> json) {
    return PickingList(
      idLista: json['IDLista'],
      codice: json['codice'],
      descrizione: json['descrizione'],
      quantita: json['quantita'],
      repartoDescrizione: json['reparto_descrizione'],
      ripiano: json['ripiano'],
      repartoCodice: json['reparto_codice'],
    );
  }


  Map<String, dynamic> toJson() =>{
    "IDLista": idLista,
    "codice":codice,
    "descrizione":descrizione,
    "quantita":quantita,
    "reparto_descrizione":repartoDescrizione,
    "ripiano":ripiano,
    "reparto_codice":repartoCodice
  };
}