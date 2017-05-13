import UIKit

internal class BusView: UIView {
    internal override func draw(_ rect: CGRect) {
        let plateBack = UIBezierPath(roundedRect: CGRect(x: 0, y: 3, width: 2, height: 14), cornerRadius: 1)
        UIColor.lightGray.set()
        plateBack.fill()

        let plateFront = UIBezierPath(roundedRect: CGRect(x: 58, y: 5, width: 2, height: 10), cornerRadius: 1)
        UIColor.lightGray.set()
        plateFront.fill()

        let body = UIBezierPath(roundedRect: CGRect(x: 1, y: 1, width: Constants.busWidth - 8, height: Constants.busHeight - 2), cornerRadius: 2.0)
        UIColor(red: 251.0/255.0, green: 202.0/255.0, blue: 11.0/255.0, alpha: 1).set()
        body.fill()

        let front = UIBezierPath(roundedRect: CGRect(x: 50, y: 1.5, width: 9, height: 17), cornerRadius: 2.0)
        front.fill()

        let glass = UIBezierPath(rect: CGRect(x: 49, y: 3, width: 3, height: 14))
        UIColor(red: 114.0/255.0, green: 202.0/255.0, blue: 239.0/255.0, alpha: 1).set()
        glass.fill()

        UIColor.black.set()
        var wheel = UIBezierPath(rect: CGRect(x: 5, y: 0, width: 5, height: 1))
        wheel.fill()
        wheel = UIBezierPath(rect: CGRect(x: 44, y: 0, width: 5, height: 1))
        wheel.fill()

        wheel = UIBezierPath(rect: CGRect(x: 5, y: 19, width: 5, height: 1))
        wheel.fill()
        wheel = UIBezierPath(rect: CGRect(x: 44, y:19, width: 5, height: 1))
        wheel.fill()

    }

    convenience init() {
        self.init(frame: CGRect(
            origin: CGPoint(x: 0, y: Constants.sectionSize * 3 / 2 - Constants.busHeight / 2),
            size: Constants.busSize))
        backgroundColor = UIColor.clear

    }
}
