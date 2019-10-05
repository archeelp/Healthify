import 'package:flutter/material.dart';

import '../models/disease.dart';
import '../models/city.dart';

const DUMMY_CITIES = const [
  City(
    id: 'c1',
    title: 'Mumbai',
    color: Colors.purple,
  ),
  City(
    id: 'c2',
    title: 'Delhi',
    color: Colors.red,
  ),
  City(
    id: 'c3',
    title: 'Banglore',
    color: Colors.orange,
  ),
  City(
    id: 'c4',
    title: 'Hyderabad',
    color: Colors.amber,
  ),
  City(
    id: 'c5',
    title: 'Pune',
    color: Colors.blue,
  ),
  City(
    id: 'c6',
    title: 'Kolkata',
    color: Colors.green,
  ),
];

const DUMMY_DISEASES = const [
  Disease(
    id: 'd1',
    cities: [
      'c1',
      'c2',
    ],
    title: 'dengue',
    type: Type.Moderate,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX88-Me9aF4W2I8NPqNG4tYP8AmlEl450vK0Ux6a9eAQq0u-EuvQ',
    duration: 20,
    symptoms: [
      'high fever',
      'cough',
      'cold',
      'low blood platelets',
    ],
    cure: [
      'Kiwi fruit ',
      'Dragon fruit',
      'It is recomended to visit doctor regularly',
      'Regular blood checkups',
    ],
  ),
  Disease(
    id: 'd2',
    cities: [
      'c3',
      'c2',
    ],
    title: 'malaria',
    type: Type.Moderate,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX88-Me9aF4W2I8NPqNG4tYP8AmlEl450vK0Ux6a9eAQq0u-EuvQ',
    duration: 20,
    symptoms: [
      'high fever',
      'cough',
      'cold',
      'low blood platelets',
    ],
    cure: [
      'Kiwi fruit ',
      'Dragon fruit',
      'It is recomended to visit doctor regularly',
      'Regular blood checkups',
    ],
  ),
  Disease(
    id: 'd3',
    cities: [
      'c3',
      'c4',
    ],
    title: 'swine flue',
    type: Type.Moderate,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX88-Me9aF4W2I8NPqNG4tYP8AmlEl450vK0Ux6a9eAQq0u-EuvQ',
    duration: 20,
    symptoms: [
      'high fever',
      'cough',
      'cold',
      'low blood platelets',
    ],
    cure: [
      'Kiwi fruit ',
      'Dragon fruit',
      'It is recomended to visit doctor regularly',
      'Regular blood checkups',
    ],
  ),
  Disease(
    id: 'd4',
    cities: [
      'c1',
      'c6',
    ],
    title: 'dengue',
    type: Type.Moderate,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX88-Me9aF4W2I8NPqNG4tYP8AmlEl450vK0Ux6a9eAQq0u-EuvQ',
    duration: 20,
    symptoms: [
      'high fever',
      'cough',
      'cold',
      'low blood platelets',
    ],
    cure: [
      'Kiwi fruit ',
      'Dragon fruit',
      'It is recomended to visit doctor regularly',
      'Regular blood checkups',
    ],
  ),
  Disease(
    id: 'd5',
    cities: [
      'c5',
    ],
    title: 'dengue',
    type: Type.Moderate,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX88-Me9aF4W2I8NPqNG4tYP8AmlEl450vK0Ux6a9eAQq0u-EuvQ',
    duration: 20,
    symptoms: [
      'high fever',
      'cough',
      'cold',
      'low blood platelets',
    ],
    cure: [
      'Kiwi fruit ',
      'Dragon fruit',
      'It is recomended to visit doctor regularly',
      'Regular blood checkups',
    ],
  ),
];
