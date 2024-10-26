class UserProfile {
  final String userName;
  final String budget;
  final String dressColor;
  final String profileImageUrl;

  UserProfile({
    required this.userName,
    required this.budget,
    required this.dressColor,
    required this.profileImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'budget': budget,
      'dressColor': dressColor,
      'profileImageUrl': profileImageUrl,
    };
  }

  static UserProfile fromMap(Map<String, dynamic> map) {
    return UserProfile(
      userName: map['userName'],
      budget: map['budget'],
      dressColor: map['dressColor'],
      profileImageUrl: map['profileImageUrl'],
    );
  }
}
