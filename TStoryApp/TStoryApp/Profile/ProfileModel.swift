struct ProfileModel {
    var profileTitle: String = ""
    var profileUrl: String = ""
    var profileImageName: String?
    var subscribeNum: Int = 0
    var category: [ProfileCategory] = []
}

struct ProfileCategory {
    var categoryName: String = ""
    var categoryNum: Int = 0
    var isSelected: Bool = false
    
    var categoryCell: [ProfileCategoryCell] = []
}

struct ProfileCategoryCell {
    var cellTitle: String = ""
    var cellImageName: String?
    var cellLikeNum: Int = 0
    var cellCommentNum: Int = 0
    var cellDate: String = ""
}
