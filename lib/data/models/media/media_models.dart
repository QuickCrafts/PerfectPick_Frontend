class BooksModel {
  int id_book;
  String author;
  String genres;
  int pages;
  double rating;
  String title;
  int year;

  BooksModel(
      {required this.id_book,
      required this.author,
      required this.genres,
      required this.pages,
      required this.rating,
      required this.title,
      required this.year});

  BooksModel.fromJson(Map<String, dynamic> json)
      : id_book = json['id_book'],
        author = json['author'],
        genres = json['genres'],
        pages = json['pages'],
        rating = json['rating'],
        title = json['title'],
        year = json['year'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_book'] = id_book;
    data['author'] = author;
    data['genres'] = genres;
    data['pages'] = pages;
    data['rating'] = rating;
    data['title'] = title;
    data['year'] = year;

    return data;
  }

  bool validate() {
    return !id_book.isNaN &&
        author.isNotEmpty &&
        genres.isNotEmpty &&
        !pages.isNaN &&
        title.isNotEmpty &&
        !year.isNaN;
  }
}

class BooksResponseModel {
  List<BooksModel> books;

  BooksResponseModel(
      {required this.books,
      });

  BooksResponseModel.fromJson(Map<BooksModel, dynamic> json)
      : books = json['GetBooks']['books'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GetBooks'] = {
      'books': books
    };
    return data;
  }

  bool validate() {
    return books.isNotEmpty;
  }
}
