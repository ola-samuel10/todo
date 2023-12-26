class MovieModel {
  final int id;
  final String name;
  final String imageUrl;
  final String date;
  final bool addedToWatchList;

  const MovieModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.date,
    required this.addedToWatchList,
  });

  MovieModel copyWith({
    int? id,
    String? name,
    String? imageUrl,
    String? date,
    bool? addedToWatchList,
  }) {
    return MovieModel(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      imageUrl: imageUrl ?? this.imageUrl,
      addedToWatchList: addedToWatchList ?? this.addedToWatchList,
    );
  }

  List<Object?> get props => [id, name, imageUrl, addedToWatchList];
}
