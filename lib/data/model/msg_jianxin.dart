class JXinMsg{
  final String title;
  final String summary;
  final String headIcon;
  final String flagIcon;
  final int timeSec;

  JXinMsg({this.title, this.summary,this.headIcon,this.flagIcon,this.timeSec});


  factory JXinMsg.fromJson(Map<String, dynamic> json){
    return JXinMsg(
      title:json['title'],
      summary:json['summary'],
      headIcon:json['headIcon'],
      flagIcon:json['flagIcon'],
      timeSec:json['timeSec'],
    );
  }
}