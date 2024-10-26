class RoomType {
  final String id;
  final String nama_tipe_kamar;
  final String deskripsi;
  final String foto;
  final int harga;
  final int rating;

  RoomType(
      {required this.id,
      required this.nama_tipe_kamar,
      required this.deskripsi,
      required this.foto,
      required this.harga,
      required this.rating});

  // Factory method to create RoomType from JSON
  factory RoomType.fromJson(Map<String, dynamic> json) {
    return RoomType(
        id: json['id'],
        nama_tipe_kamar: json['nama_tipe_kamar'],
        deskripsi: json['deskripsi'],
        foto: json['foto'],
        harga: json['harga'],
        rating: json['rating']);
  }

  // Method to convert RoomType to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_tipe_kamar': nama_tipe_kamar,
      'deskripsi': deskripsi,
      'foto': foto,
      'harga': harga,
      'rating': rating
    };
  }
}
