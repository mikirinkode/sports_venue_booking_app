
import 'package:spod_app/model/field_facility.dart';
import 'package:spod_app/model/field_order.dart';
import 'package:spod_app/model/sport_category.dart';
import 'package:spod_app/model/sport_field.dart';

var _basketball = SportCategory(
  name: "Basketball",
  image: "assets/icons/basketball.png",
);
var _futsal = SportCategory(
  name: "Futsal",
  image: "assets/icons/soccer.png",
);
var _volley = SportCategory(
  name: "Volley",
  image: "assets/icons/volley.png",
);
var _tableTennis = SportCategory(
  name: "Table Tennis",
  image: "assets/icons/table_tennis.png",
);
var _tennis = SportCategory(
  name: "Tennis",
  image: "assets/icons/tennis.png",
);

List<SportCategory> sportCategories = [
  _basketball,
  _tennis,
  _volley,
  _futsal,
  _tableTennis,
];

var _wifi = FieldFacility(name: "WiFi", imageAsset: "assets/icons/wifi.png");
var _toilet =
    FieldFacility(name: "Toilet", imageAsset: "assets/icons/toilet.png");
var _changingRoom = FieldFacility(
    name: "Changing Room", imageAsset: "assets/icons/changing_room.png");
var _canteen =
    FieldFacility(name: "Canteen", imageAsset: "assets/icons/canteen.png");
var _locker =
    FieldFacility(name: "Lockers", imageAsset: "assets/icons/lockers.png");
var _chargingArea = FieldFacility(
    name: "Charging Area", imageAsset: "assets/icons/charging.png");

SportField futsal1 = SportField(
    id: "01",
    name: "Rionov Football field",
    address: "Jendral Sudirman street no. 31",
    category: _futsal,
    facilities: [_wifi, _toilet],
    phoneNumber: "0812 2345 6789",
    openDay: "Monday to Sunday",
    openTime: "08.00 – 16.00",
    imageAsset: "assets/images/pringsewu_futsal.jpg",
    price: 80000,
    author: "Daniel larionov",
authorUrl: "https://unsplash.com/@foxysnaps",
  imageUrl: "https://unsplash.com/photos/oXCgQRsb2ug",
);

SportField basketball1 = SportField(
    id: "02",
    name: "Vio Sport Center",
    address: "Tanah Agung street no. 12",
    category: _basketball,
    facilities: [_wifi, _toilet, _changingRoom, _canteen],
    author: "Fulvio ambrosanio",
    authorUrl: "https://unsplash.com/@fiercelupus",
    imageUrl: "https://unsplash.com/photos/zygvOSND4rI",
    phoneNumber: "0812 3333 4444",
    openDay: "Monday to Sunday",
    openTime: "07.00 – 22.00",
    imageAsset: "assets/images/vio_basketball.jpg",
    price: 100000);
SportField volley1 = SportField(
    id: "03",
    name: "Voli Pantai Tanjung",
    address: "Tanjung Tinggi street no. 9",
    category: _volley,
    facilities: [_wifi, _toilet, _canteen, _chargingArea, _changingRoom],
    author: "Meritt Thomas",
    authorUrl: "https://unsplash.com/@merittthomas",
    imageUrl: "https://unsplash.com/photos/rgo4m8J0H2M",
    phoneNumber: "0866 7777 8888",
    openDay: "Monday to Sunday",
    openTime: "07.00 – 17.00",
    imageAsset: "assets/images/voli_pantai.jpg",
    price: 115000);
SportField tableTennis1 = SportField(
    id: "04",
    name: "Tenis Meja D’cortez",
    address: "Sukamakmur street no. 24",
    category: _tableTennis,
    facilities: [_wifi, _toilet, _canteen],
    author: "Ivan cortez",
    authorUrl: "https://unsplash.com/@ivancortez14",
    imageUrl: "https://unsplash.com/photos/c9aGBqkeoE4",
    phoneNumber: "0833 4444 5555",
    openDay: "Monday to Saturday",
    openTime: "09.00 – 23.00",
    imageAsset: "assets/images/tenis_meja_cortez.jpg",
    price: 50000);
SportField basketball2 = SportField(
    id: "05",
    name: "Kali Basketball",
    address: "Kalimegah street no. 55",
    category: _basketball,
    facilities: [_toilet],
    author: "Ilnur kalimullin",
    authorUrl: "https://unsplash.com/@kalimullin",
    imageUrl: "https://unsplash.com/photos/kP1AxmCyEXM",
    phoneNumber: "0888 9999 1111",
    openDay: "Monday to Sunday",
    openTime: "06.00 – 18.00",
    imageAsset: "assets/images/kali_basketball.jpg",
    price: 75000);

SportField basketball3 = SportField(
    id: "06",
    name: "LM Basketball",
    address: "Mekarsari street no. 17",
    category: _basketball,
    facilities: [_toilet],
    author: "Lucas Marcomini",
    authorUrl: "https://unsplash.com/@lucasmarcomini",
    imageUrl: "https://unsplash.com/photos/77pAlgB8v_E",
    phoneNumber: "0855 6666 7777",
    openDay: "Monday to Sunday",
    openTime: "09.00 – 18.00",
    imageAsset: "assets/images/lm_basketball.jpg",
    price: 85000);

SportField tennis1 = SportField(
    id: "07",
    name: "DC Tennis Court",
    address: "Kartanegara street no 76",
    category: _tennis,
    facilities: [_wifi, _toilet, _locker],
    author: "Denise chan",
    authorUrl: "https://unsplash.com/photos/hAr9Nlo2Fz4",
    imageUrl: "https://unsplash.com/@noripurrs",
    phoneNumber: "0811 2222 3333",
    openDay: "Monday to Saturday",
    openTime: "08.00 – 17.00",
    imageAsset: "assets/images/dc_tennis_court.jpg",
    price: 65000);

SportField tennis2 = SportField(
    id: "08",
    name: "Tennis Coates",
    address: "Prakasa street no. 29",
    category: _tennis,
    facilities: [_toilet, _changingRoom, _chargingArea],
    author: "Rob coates",
    authorUrl: "https://unsplash.com/@itsrobcoates",
    imageUrl: "https://unsplash.com/photos/BDCTRVu7DwY",
    phoneNumber: "0877 8888 9999",
    openDay: "Monday to Saturday",
    openTime: "08.00 – 15.00",
    imageAsset: "assets/images/tennis_coates.jpg",
    price: 60000);

SportField futsal2 = SportField(
    id: "09",
    name: "Jaya futsal",
    address: "Sinagara street no. 53",
    category: _futsal,
    facilities: [_toilet, _canteen],
    author: "Izuddin Helmi Adnan",
    authorUrl: "https://unsplash.com/@izuddinhelmi",
    imageUrl: "https://unsplash.com/photos/siurZcdJGEw",
    phoneNumber: "0844 5555 6666",
    openDay: "Monday to Sunday",
    openTime: "08.00 – 18.00",
    imageAsset: "assets/images/jaya_futsal.jpg",
    price: 70000);

SportField tennis3 = SportField(
    id: "010",
    name: "Wing Sport Center",
    address: "Veteran street no. 93",
    category: _tennis,
    facilities: [_toilet, _changingRoom, _locker, _canteen],
    author: "Sergei Wing",
    authorUrl: "https://unsplash.com/@sergeiwing",
    imageUrl: "https://unsplash.com/photos/Bt-oCv_YI3E",
    phoneNumber: "0899 1010 2222",
    openDay: "Monday to Sunday",
    openTime: "09.00 – 17.00",
    imageAsset: "assets/images/wing_tennis.jpg",
    price: 80000);

List<SportField> sportFieldList = [
  futsal1,
  basketball1,
  volley1,
  tableTennis1,
  basketball2,
  basketball3,
  tennis1,
  tennis2,
  futsal2,
  tennis3,
];

List<SportField> recommendedSportField = [
  basketball1,
  tennis3,
  volley1,
  tableTennis1,
  futsal1
];

List <FieldOrder> dummyUserOrderList = [];