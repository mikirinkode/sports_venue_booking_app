import 'package:flutter/material.dart';
import 'package:spod_app/model/sport_field.dart';

import '../model/sport_category.dart';

var _basketball = SportCategory(
    name: "Basketball",
    image: "assets/icons/basketball.png",
    boxColor: Colors.orange);
var _futsal = SportCategory(
    name: "Futsal", image: "assets/icons/soccer.png", boxColor: Colors.orange);
var _volley = SportCategory(
    name: "Volley", image: "assets/icons/volley.png", boxColor: Colors.orange);
var _tableTennis = SportCategory(
    name: "Table Tennis",
    image: "assets/icons/table_tennis.png",
    boxColor: Colors.orange);
var _tennis =
SportCategory(
    name: "Tennis", image: "assets/icons/tennis.png", boxColor: Colors.orange);

List<SportCategory> sportCategories = [
  _basketball,
  _futsal,
  _volley,
  _tableTennis,
  _tennis
];

List<SportField> sportFieldList = [
  SportField(
      id: "01",
      name: "Pringsewu Futsal",
      address: "Jln. Jendral Sudirman no. 31",
      author: "Daniel larionov",
      phoneNumber: "0812 2345 6789",
      openDay: "Senin – Minggu",
      openTime: "08.00 – 16.00",
      imageAsset: "assets/images/pringsewu_futsal.jpg",
      price: 80000),

  SportField(
      id: "02",
      name: "DC Tennis Court",
      address: "Jln. Kartanegara no 76",
      author: "Denise chan",
      phoneNumber: "0811 2222 3333",
      openDay: "Senin – Sabtu",
      openTime: "08.00 – 17.00",
      imageAsset: "assets/images/dc_tennis_court.jpg",
      price: 65000
  ),

  SportField(
      id: "03",
      name: "Vio Sport Center",
      address: "Jln.  Tanah Agung no. 12",
      author: "Fulvio ambrosanio",
      phoneNumber: "0812 3333 4444",
      openDay: "Senin – Minggu",
      openTime: "07.00 – 22.00",
      imageAsset: "assets/images/vio_basketball.jpg",
      price: 100000
  ),

  SportField(
      id: "04",
      name: "Tenis Meja D’cortez",
      address: "Jln. Sukamakmur no. 24",
      author: "Ivan cortez",
      phoneNumber: "0833 4444 5555",
      openDay: "Senin – Sabtu",
      openTime: "09.00 – 23.00",
      imageAsset: "assets/images/tenis_meja_cortez.jpg",
      price: 50000
  ),

  SportField(
      id: "05",
      name: "Jaya futsal",
      address: "Jln. Sinagara no. 53",
      author: "Izuddin Helmi Adnan",
      phoneNumber: "0844 5555 6666",
      openDay: "Senin – Minggu",
      openTime: "08.00 – 18.00",
      imageAsset: "assets/images/jaya_futsal.jpg",
      price: 70000
  ),

  SportField(
      id: "06",
      name: "LM Basketball",
      address: "Jln. Mekarsari no. 17",
      author: "Lucas Marcomini",
      phoneNumber: "0855 6666 7777",
      openDay: "Senin – Minggu",
      openTime: "09.00 – 18.00",
      imageAsset: "assets/images/lm_basketball.jpg",
      price: 85000
  ),

  SportField(
      id: "07",
      name: "Voli Pantai Tanjung",
      address: "Jln. Tanjung Tinggi no. 9",
      author: "Meritt Thomas",
      phoneNumber: "0866 7777 8888",
      openDay: "Senin – Minggu",
      openTime: "07.00 – 17.00",
      imageAsset: "assets/images/voli_pantai.jpg",
      price: 115000
  ),

  SportField(
      id: "08",
      name: "Tennis Coates",
      address: "Jln. Prakasa no. 29",
      author: "Rob coates",
      phoneNumber: "0877 8888 9999",
      openDay: "Senin – Sabtu",
      openTime: "08.00 – 15.00",
      imageAsset: "assets/images/tennis_coates.jpg",
      price: 60000
  ),

  SportField(
      id: "09",
      name: "Kali Basketball",
      address: "Jln. Kalimegah no. 55",
      author: "Ilnur kalimullin",
      phoneNumber: "0888 9999 1111",
      openDay: "Senin – Minggu",
      openTime: "06.00 – 18.00",
      imageAsset: "assets/images/kali_basketball.jpg",
      price: 75000
  ),

  SportField(
      id: "010",
      name: "Wing Sport Center",
      address: "Jln. Veteran no. 93",
      author: "Sergei Wing",
      phoneNumber: "0899 1010 2222",
      openDay: "Senin – Minggu",
      openTime: "09.00 – 17.00",
      imageAsset: "assets/images/wing_tennis.jpg",
      price: 80000
  ),
];