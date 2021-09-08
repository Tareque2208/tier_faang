class PopularFilterListData {
  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'Asymptotic',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Algorithmic',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Big-O',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Design',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Networking',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'Unit Testing',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Scheduling',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Caching',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'System Designs',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Scalability',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Data Handling',
      isSelected: false,
    ),
  ];
}
