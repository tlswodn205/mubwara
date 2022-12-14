class OptionSaveReqDto {
  int optionList;

  OptionSaveReqDto(this.optionList);

  Map<String, dynamic> toJson() => {
        "optionList": optionList,
      };
}
