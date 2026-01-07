class Book {
  final String bookName;
  final String title;
  final int totalPages;

  Book({
    required this.bookName,
    required this.title,
    required this.totalPages,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookName: json['book_name'] ?? '',
      title: json['title'] ?? '',
      totalPages: json['total_pages'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'book_name': bookName,
      'title': title,
      'total_pages': totalPages,
    };
  }

  @override
  String toString() {
    return 'Book(bookName: $bookName, title: $title, totalPages: $totalPages)';
  }
}

class BookListResponse {
  final String status;
  final List<Book> books;

  BookListResponse({
    required this.status,
    required this.books,
  });

  factory BookListResponse.fromJson(Map<String, dynamic> json) {
    return BookListResponse(
      status: json['status'] ?? '',
      books: (json['books'] as List<dynamic>?)
          ?.map((bookJson) => Book.fromJson(bookJson as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'books': books.map((book) => book.toJson()).toList(),
    };
  }
}





