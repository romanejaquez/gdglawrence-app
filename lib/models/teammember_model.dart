class TeamMember {
  String name;
  String title;
  String subTitle;
  String bio;
  String imgPath;
  List<TeamSocialLink> contactInfo;

  TeamMember({
    this.name,
    this.title,
    this.subTitle,
    this.bio,
    this.imgPath,
    this.contactInfo
  });

}

class TeamSocialLink {
  String type;
  String value;

  TeamSocialLink({
    this.type,
    this.value
  });
}