
class Book {
  static const booksname = 'books';
  String? id;
  String? title;
  String? Author;
  String? category;
  String? pdfUrl;
  String? imageUrl;

  Book({required this.title, required this.category, required this.Author,required this.imageUrl,required this.pdfUrl});

  Book.fromjeson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    Author = data['Author'];
    category = data['category'];
    pdfUrl = data['pdfUrl'];
    imageUrl = data['imageUrl'];

  }
  Map<String, dynamic> tojeson() {
    return {
      'id': id,
      'title': title,
      'Author': Author ,
      'category': category,
      'pdfUrl': pdfUrl,
      'imageUrl':imageUrl
    };
  }
}