import UIKit

class RoadSectionView: UIView {
    var direction: Direction = .left
    var corner: UIRectCorner?
    let backgroundImageView = UIImageView(image: UIImage(named: "Road.jpg"))

    init(origin: CGPoint, direction: Direction, corner: UIRectCorner?) {
        let size = CGSize(width: 50, height: 50)
        super.init(frame: CGRect(origin: origin, size: size))

        backgroundImageView.frame = self.bounds
        self.addSubview(backgroundImageView)

        self.direction = direction
        self.maskCorner(corner: corner)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func maskCorner(corner: UIRectCorner?) {
        self.corner = corner
        if let corner = corner {
            let path = UIBezierPath(roundedRect:self.bounds,
                                    byRoundingCorners:[corner],
                                    cornerRadii: CGSize(width: 20, height:  20))

            let maskLayer = CAShapeLayer()

            maskLayer.path = path.cgPath
            backgroundImageView.layer.mask = maskLayer
        }
    }
}

class SchoolRoadSectionView: RoadSectionView {
    override init(origin: CGPoint, direction: Direction, corner: UIRectCorner?) {
        super.init(origin: origin, direction: direction, corner: corner)
        let school = UIImageView(image: UIImage(named: "School.png"))
        let origin = CGPoint(x: -5, y: -50)
        school.frame = CGRect(origin: origin, size: school.frame.size)
        addSubview(school)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class HomeRoadSectionView: RoadSectionView {
    override init(origin: CGPoint, direction: Direction, corner: UIRectCorner?) {
        super.init(origin: origin, direction: direction, corner: corner)
        let school = UIImageView(image: UIImage(named: "Home.png"))
        let origin = CGPoint(x: 5, y: -30)
        school.frame = CGRect(origin: origin, size: school.frame.size)
        addSubview(school)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
