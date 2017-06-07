import UIKit

enum Constants {
    static let busWidth = 60
    static let busHeight = 20
    static let busSize = CGSize(width: Constants.busWidth, height: Constants.busHeight)

    static let mainViewSize = 600
    static let sectionSize = 50
    static var lineLength: Int {
        return mainViewSize / sectionSize
    }
}
