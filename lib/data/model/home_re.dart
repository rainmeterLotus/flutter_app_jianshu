class HomeRe{
  final String title;
  final String bigBannerUrl;
  final String summary;
  final String author;
  final int seeNum;
  final int likeNum;
  final int discussNum;
  final List<String> listImg;

  HomeRe({this.title,this.summary,this.author,this.bigBannerUrl,this.seeNum,this.likeNum
  ,this.discussNum,this.listImg});

  String toString(){
    return "title="+this.title+"summary="+this.summary+"author="+this.author+"bigBannerUrl="+this.bigBannerUrl
    +"seeNum="+this.seeNum.toString()+"likeNum="+this.likeNum.toString()+"discussNum="+this.discussNum.toString()
        +"listImg"+this.listImg.toString();
  }

  factory HomeRe.fromJson(Map<String, dynamic> json){
    return HomeRe(
      title:json['title'],
      bigBannerUrl:json['bigBannerUrl'],
      summary:json['summary'],
      author:json['author'],
      seeNum:json['seeNum'],
      likeNum:json['likeNum'],
      discussNum:json['discussNum'],
      listImg:List.from(json['listImg']),
    );
  }
}