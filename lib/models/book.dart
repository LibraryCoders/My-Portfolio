

class Book{
  final String id;
  final int bookId;
  final String title;
  final String author;
  final String language;
  final String genre;
  final String description;
  final List<String> tags;
  final String pdfLink;
  final String thumbnail;
  final DateTime createdAt;

  const Book({
    required this.id,
    required this.bookId,
    required this.title,
    required this.author,
    required this.language,
    required this.genre,
    required this.description,
    required this.tags,
    required this.pdfLink,
    required this.thumbnail,
    required this.createdAt,
  });

  // Factory constructor to create an instance from a JSON map
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['_id'] as String,
      bookId: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      language: json['language'] as String,
      genre: json['genre'] as String,
      description: json['description'] as String,
      tags: List<String>.from(json['tags'] as List<dynamic>),
      pdfLink: json['pdfLink'] as String,
      thumbnail: json['thumbnail'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  // Method to convert the instance back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'id': bookId,
      'title': title,
      'author': author,
      'language': language,
      'genre': genre,
      'description': description,
      'tags': tags,
      'pdfLink': pdfLink,
      'thumbnail': thumbnail,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Method to create a copy of an instance with optional new values
  Book copyWith({
    String? id,
    int? bookId,
    String? title,
    String? author,
    String? language,
    String? genre,
    String? description,
    List<String>? tags,
    String? pdfLink,
    String? thumbnail,
    DateTime? createdAt,
  }) {
    return Book(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      title: title ?? this.title,
      author: author ?? this.author,
      language: language ?? this.language,
      genre: genre ?? this.genre,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      pdfLink: pdfLink ?? this.pdfLink,
      thumbnail: thumbnail ?? this.thumbnail,
      createdAt: createdAt ?? this.createdAt,
    );
  }

}
