class BooksModel {
  String? typename;
  String? id_book;
  String? author;
  String? genres;
  int? pages;
  double? rating;
  String? title;
  int? year;

  BooksModel(
      {required this.typename,
      required this.id_book,
      required this.author,
      required this.genres,
      required this.pages,
      required this.rating,
      required this.title,
      required this.year});

  BooksModel.fromJson(Map<String, dynamic> json)
      : typename = json['__typename'],
        id_book = json['id_book'],
        author = json['author'],
        genres = json['genres'],
        pages = json['pages'],
        rating = json['rating'],
        title = json['title'],
        year = json['year'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = typename;
    data['id_book'] = id_book;
    data['author'] = author;
    data['genres'] = genres;
    data['pages'] = pages;
    data['rating'] = rating;
    data['title'] = title;
    data['year'] = year;

    return data;
  }
}

class BooksResponseModel {
  List<BooksModel> books;

  BooksResponseModel({
    required this.books,
  });

  BooksResponseModel.fromJson(Map<String, dynamic> json)
      : books = json['GetBooks']['books'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GetBooks'] = {'books': books};
    return data;
  }

  bool validate() {
    return books.isNotEmpty;
  }
}

class SongsModel {
  String? idSong;
  String? album;
  String? artist;
  int? duration;
  String? genres;
  String? title;
  int? year;
  String? typename;

  SongsModel(
      {required this.idSong,
      required this.album,
      required this.artist,
      required this.duration,
      required this.genres,
      required this.title,
      required this.year,
      required this.typename});

  SongsModel.fromJson(Map<String, dynamic> json)
      : idSong = json['idSong'],
        album = json['album'],
        artist = json['artist'],
        duration = json['duration'],
        genres = json['genres'],
        title = json['title'],
        year = json['year'],
        typename = json['__typename'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idSong'] = idSong;
    data['album'] = album;
    data['artist'] = artist;
    data['duration'] = duration;
    data['genres'] = genres;
    data['title'] = title;
    data['year'] = year;
    data['__typename'] = typename;
    return data;
  }
}

class SongsResponseModel {
  List<SongsModel> songs;

  SongsResponseModel({
    required this.songs,
  });

  SongsResponseModel.fromJson(Map<String, dynamic> json)
      : songs = json['GetSongs']['songs'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GetSongs'] = {'songs': songs};
    return data;
  }

  bool validate() {
    return songs.isNotEmpty;
  }
}

class MoviesModel {
  String? idMovie;
  String? awards;
  String? cast;
  String? director;
  String? duration;
  int? episodes;
  String? genre;
  String? originalTitle;
  double? rating;
  String? releaseDate;
  int? seasons;
  String? title;
  String? writers;
  String? typename;

  MoviesModel(
      {required this.idMovie,
      required this.awards,
      required this.cast,
      required this.director,
      required this.duration,
      required this.episodes,
      required this.genre,
      required this.originalTitle,
      required this.rating,
      required this.releaseDate,
      required this.seasons,
      required this.title,
      required this.writers,
      required this.typename});

  MoviesModel.fromJson(Map<String, dynamic> json)
      : idMovie = json['idMovie'],
        awards = json['awards'],
        cast = json['cast'],
        director = json['director'],
        duration = json['duration'],
        episodes = json['episodes'],
        genre = json['genre'],
        originalTitle = json['originalTitle'],
        rating = json['rating'],
        releaseDate = json['releaseDate'],
        seasons = json['seasons'],
        title = json['title'],
        writers = json['writers'],
        typename = json['__typename'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMovie'] = idMovie;
    data['awards'] = awards;
    data['cast'] = cast;
    data['director'] = director;
    data['duration'] = duration;
    data['episodes'] = episodes;
    data['genre'] = genre;
    data['originalTitle'] = originalTitle;
    data['rating'] = rating;
    data['releaseDate'] = releaseDate;
    data['seasons'] = seasons;
    data['title'] = title;
    data['writers'] = writers;
    data['__typename'] = typename;
    return data;
  }
}

class MoviesResponseModel {
  List<MoviesModel> movies;

  MoviesResponseModel({
    required this.movies,
  });

  MoviesResponseModel.fromJson(Map<String, dynamic> json)
      : movies = json['GetMovies']['movies'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GetMovies'] = {'movies': movies};
    return data;
  }

  bool validate() {
    return movies.isNotEmpty;
  }
}
