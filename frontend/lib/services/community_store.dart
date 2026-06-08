enum OutfitImageType {
  oliveShirt,
  blackWhite,
  flatlay,
  ivoryShirt,
  bag,
}

class CommunityPost {
  String user;
  String time;
  String title;
  String body;
  List<String> tags;
  OutfitImageType imageType;
  List<String> imagePaths;
  Map<String, String> itemInfo;
  int likes;
  bool isLiked;
  bool isSaved;

  CommunityPost({
    required this.user,
    required this.time,
    required this.title,
    required this.body,
    required this.tags,
    required this.likes,
    required this.imageType,
    this.imagePaths = const [],
    this.itemInfo = const {},
    this.isLiked = false,
    this.isSaved = false,
  });

  bool get isMine => user == CommunityStore.myUserName;

  void updateFrom(CommunityPost post) {
    title = post.title;
    body = post.body;
    tags = post.tags;
    imagePaths = post.imagePaths;
    itemInfo = post.itemInfo;
    imageType = post.imageType;
  }
}

class CommunityStore {
  static const myUserName = 'me.style';

  static final List<CommunityPost> posts = [
    CommunityPost(
      user: 'so.min',
      time: '2시간 전',
      title: '오늘의 데일리룩',
      body: '라이트 올리브 컬러 셔츠로 포인트 줬어요!\n블랙 팬츠랑 매치하니까 깔끔하면서도 세련된 느낌이 나요.',
      tags: ['데일리룩', '라이트올리브', '셔츠코디', '심플룩'],
      likes: 132,
      imageType: OutfitImageType.oliveShirt,
      itemInfo: {
        '상의': '라이트 올리브 셔츠',
        '하의': '블랙 팬츠',
        '신발': '블랙 로퍼',
        '그 외': '미니 숄더백',
      },
    ),
    CommunityPost(
      user: 'yeon.style',
      time: '4시간 전',
      title: '블랙 & 화이트 조합 최고',
      body: '역시 기본 컬러 조합이 제일 무난하고 어디에나 잘 어울리는 것 같아요!',
      tags: ['블랙앤화이트', '미니멀룩', '데일리룩', '꾸안꾸'],
      likes: 98,
      imageType: OutfitImageType.blackWhite,
      itemInfo: {
        '아우터': '블랙 자켓',
        '상의': '화이트 티셔츠',
        '하의': '블랙 슬랙스',
      },
    ),
    CommunityPost(
      user: 'daily._.ji',
      time: '8시간 전',
      title: '요즘 자주 쓰는 아이템들',
      body: '활용도 높은 아이템들을 모아봤어요. 톤만 맞춰도 매일 들고 다니기 좋더라구요.',
      tags: ['추천아이템', '데일리가방', '아이템추천'],
      likes: 76,
      imageType: OutfitImageType.flatlay,
    ),
  ];

  static List<CommunityPost> get likedPosts =>
      posts.where((post) => post.isLiked).toList();

  static List<CommunityPost> get savedPosts =>
      posts.where((post) => post.isSaved).toList();

  static List<CommunityPost> get myPosts =>
      posts.where((post) => post.isMine).toList();
}
