// home_providers.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider pour les données du carousel
final carouselImagesProvider = FutureProvider<List<String>>((ref) async {
  // Simuler un délai de chargement réseau
  await Future.delayed(const Duration(seconds: 2));
  return List.generate(
    5, 
    (index) => 'https://picsum.photos/500/300?random=$index'
  );
});

// Provider pour les adresses récentes
final recentAddressesProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return List.generate(5, (index) => {
    'image': 'https://picsum.photos/200/200?random=${index + 10}',
    'address': '123 Street $index',
    'city': 'City $index',
  });
});

// Provider pour les services récents
final recentServicesProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return List.generate(5, (index) => {
    'image': 'https://picsum.photos/200/200?random=${index + 20}',
    'service': 'Service $index',
    'description': 'Description of service $index',
    'date': '2024-01-${index + 1}',
  });
});

// In home_providers.dart
final categoriesProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  // Simulate loading delay if needed
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    {
      'icon': Icons.restaurant,
      'title': 'Restaurant',
      'color': const Color(0xFF4CAF50),
    },
    {
      'icon': Icons.hotel,
      'title': 'Hotel',
      'color': const Color(0xFFF44336),
    },
    {
      'icon': Icons.sports_esports,
      'title': 'Leisure',
      'color': const Color(0xFF2196F3),
    },
    {
      'icon': Icons.account_balance,
      'title': 'Bank',
      'color': const Color(0xFF9C27B0),
    },
    {
      'icon': Icons.shopping_cart,
      'title': 'Store',
      'color': const Color(0xFF607D8B),
    },
    {
      'icon': Icons.local_hospital,
      'title': 'Health',
      'color': const Color(0xFFE91E63),
    },
    {
      'icon': Icons.miscellaneous_services,
      'title': 'Public Serv.',
      'color': const Color(0xFF00BCD4),
    },
    {
      'icon': Icons.more_horiz,
      'title': 'More',
      'color': const Color(0xFFFF9800),
    },
  ];
});