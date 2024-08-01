class AvatarGroupItemModel {
  final String? url;
  final String? name;
  final bool isExtent;

  AvatarGroupItemModel({this.url, this.name, this.isExtent = false}) {
    if (url == null && name == null) {
      throw Exception('url & name cannot be null');
    }
  }

  @override
  String toString() {
    return 'AvatarGroupItem(url: $url, name: $name, isExtent $isExtent)';
  }
}
