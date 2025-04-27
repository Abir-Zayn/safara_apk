class Destination {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final String location;
  final double price;

  Destination({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.location,
    required this.price,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      location: json['location'],
      price: json['price'].toDouble(),
    );
  }
}

final List<Destination> destinations = [
  Destination(
    id: '1',
    title: 'Mountain Retreat',
    imageUrl:
        'https://plus.unsplash.com/premium_photo-1668351277191-9df852eb657f?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    rating: 4.8,
    location: 'Himalayas, Nepal',
    price: 1200,
  ),
  Destination(
    id: '2',
    title: 'Beach Paradise',
    imageUrl:
        'https://images.unsplash.com/photo-1587222318667-31212ce2828d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    rating: 4.6,
    location: 'Maldives',
    price: 1800,
  ),
  Destination(
    id: '3',
    title: 'River Valley',
    imageUrl:
        'https://images.unsplash.com/photo-1628703724622-b5cc4f753793?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    rating: 4.5,
    location: 'Amazon, Brazil',
    price: 950,
  ),
  Destination(
    id: '4',
    title: 'Countryside Villa',
    imageUrl:
        'https://images.unsplash.com/photo-1651309259727-99b5f13f3a1a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    rating: 4.7,
    location: 'Tuscany, Italy',
    price: 1100,
  ),
];
