// @dart=2.9
class MusicProfile {
  String title;
  String artist;
  String img;
  String audio;

  MusicProfile({this.title, this.artist, this.img, this.audio});

  MusicProfile.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    artist = json['artist'];
    img = json['img'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['artist'] = this.artist;
    data['img'] = this.img;
    data['audio'] = this.audio;
    return data;
  }
}