import 'package:flutter/material.dart';
import 'album.dart';

Album ntuclose = Album([
  '/albums/ntuclose/_DSF1221.jpg',
  '/albums/ntuclose/_DSF1229.jpg',
  '/albums/ntuclose/_DSF1278.jpg',
  '/albums/ntuclose/_DSF1295.jpg',
  '/albums/ntuclose/_DSF1301.jpg',
  '/albums/ntuclose/_DSF1346.jpg',
  '/albums/ntuclose/_DSF1427.jpg',
  '/albums/ntuclose/_DSF1429.jpg',
  '/albums/ntuclose/_DSF1435.jpg',
  '/albums/ntuclose/_DSF1442.jpg',
  '/albums/ntuclose/_DSF1451.jpg',
  '/albums/ntuclose/_DSF1474.jpg',
  '/albums/ntuclose/_DSF1493.jpg',
  '/albums/ntuclose/_DSF1522.jpg',
  '/albums/ntuclose/_DSF1561.jpg',
  '/albums/ntuclose/_DSF1564.jpg',
], [
  '/albums/ntuclose/full/_DSF1221.jpg',
  '/albums/ntuclose/full/_DSF1229.jpg',
  '/albums/ntuclose/full/_DSF1278.jpg',
  '/albums/ntuclose/full/_DSF1295.jpg',
  '/albums/ntuclose/full/_DSF1301.jpg',
  '/albums/ntuclose/full/_DSF1346.jpg',
  '/albums/ntuclose/full/_DSF1427.jpg',
  '/albums/ntuclose/full/_DSF1429.jpg',
  '/albums/ntuclose/full/_DSF1435.jpg',
  '/albums/ntuclose/full/_DSF1442.jpg',
  '/albums/ntuclose/full/_DSF1451.jpg',
  '/albums/ntuclose/full/_DSF1474.jpg',
  '/albums/ntuclose/full/_DSF1493.jpg',
  '/albums/ntuclose/full/_DSF1522.jpg',
  '/albums/ntuclose/full/_DSF1561.jpg',
  '/albums/ntuclose/full/_DSF1564.jpg',
]);

final List<Image> photos = ntuclose.photosList();
final List<Image> photos_full = ntuclose.photosFullList();

void setStr() {
  ntuclose.photos[0].setDescipExpos('舟山路口', '1/250, f/5.6');
  ntuclose.photos[1].setDescipExpos('舟山路口', '1/500, f/5.6');
  ntuclose.photos[2].setDescipExpos('社會科學院圖書館', '1/40, f/7.1');
  ntuclose.photos[3].setDescipExpos('118巷，巧味快餐', '1/40, f/9');
  ntuclose.photos[4].setDescipExpos('118巷，水果攤', '1/40, f/7.1');
  ntuclose.photos[5].setDescipExpos('籃球場', '1/3200, f/3.6');
  ntuclose.photos[6].setDescipExpos('溫州街，笠原麵食館', '1/250, f/4.5');
  ntuclose.photos[7].setDescipExpos('普通教學館', '1/250, f/5.6');
  ntuclose.photos[8].setDescipExpos('普通教學館', '1/250, f/5.6');
  ntuclose.photos[9].setDescipExpos('小福廣場', '1/320, f/4');
  ntuclose.photos[10].setDescipExpos('博雅教學館', '1/250, f/4.5');
  ntuclose.photos[11].setDescipExpos('博雅教學館', '1/40, f/4');
  ntuclose.photos[12].setDescipExpos('農業綜合館', '1/80, f/4.5');
  ntuclose.photos[13].setDescipExpos('臺大正門口', '1/30, f/4');
  ntuclose.photos[14].setDescipExpos('臺大正門口', '1/30, f/4');
  ntuclose.photos[15].setDescipExpos('捷運公館站', '1/30, f/2.8');
}
