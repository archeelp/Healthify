import 'package:app/models/city.dart';

import './models/disease.dart';
import './models/city.dart';

const List<City> DUMMY_CITIES = const [
  City(
    id: 'c1',
    title: 'Mumbai',
    imageUrl: 'lib/assets/Gateway-monument-India-entrance-Mumbai-Harbour-coast.jpg'
  ),
  City(
    id: 'c2',
    title: 'Delhi',
    imageUrl: 'lib/assets/new-delhi-india-gate-147623366844-orijgp.jpg'
  ),
  City(
    id: 'c3',
    title: 'Bangalore',
    imageUrl: 'lib/assets/jctp0084-central-area-bangalore-india-moore-3.jpg'
  ),
  City(
    id: 'c4',
    title: 'Hyderabad',
    imageUrl: 'lib/assets/HYDERABAD.jpg'
  ),
  City(
    id: 'c5',
    title: 'Pune',
    imageUrl: 'lib/assets/shaniwar-wada-pune-tourism-entry-fee-timings-holidays-reviews-header.jpg'
  ),
  City(
    id: 'c6',
    title: 'Kolkata',
    imageUrl: 'lib/assets/KOLKATA.jpg'
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
    duration: 20-25,
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
    duration: 30,
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
    title: 'jaundice',
    type: Type.Moderate,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX88-Me9aF4W2I8NPqNG4tYP8AmlEl450vK0Ux6a9eAQq0u-EuvQ',
    duration: 10,
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
    title: 'cholera',
    type: Type.Moderate,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX88-Me9aF4W2I8NPqNG4tYP8AmlEl450vK0Ux6a9eAQq0u-EuvQ',
    duration: 15,
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
    id: 'd6',
    cities: [
      'c6',
    ],
    title: 'Tuberculosis',
    type: Type.Chronic,
    imageUrl:
    'https://www.shutterstock.com/image-illustration/bacteria-mycobacterium-tuberculosis-causative-agent-3d-1013219203',
    duration: 30,
    symptoms: [
      'pain in chest',
      'cough',
      'cold',
      'shortness of breath',
    ],
    cure: [
      'Long medical treatments',
      'High vitamin C diet',
      'It is recomended to visit doctor regularly',
      'Regular blood checkups',
    ],
  ),
];
