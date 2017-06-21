import UIKit

enum Direction {
    case left, right, downLeft, downRight
}

public class Canvas: UIView {
    var x = 0
    var y = 1
    var currentDirectionIndex = 0
    let directions: [Direction] = [.right, .downRight, .left, .downLeft]
    let animationQueue = AnimationQueue()

    var roadSections = [RoadSectionView]()
    var busView = BusView()
    var busPosition = 0

    public convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
        createGrassBackground()
        createBus()
    }

    public func createRoadSection() {
        let roadSectionView = RoadSectionView(origin: getOrigin(), direction: getCurrentDirection(), corner: getCorner())
        append(section: roadSectionView)
    }

    public func createSchoolRoadSection() {
        let roadSectionView = SchoolRoadSectionView(origin: getOrigin(), direction: getCurrentDirection(), corner: getCorner())
        roadSectionView.layer.zPosition = 10
        append(section: roadSectionView)
    }

    public func createHomeRoadSection() {
        let roadSectionView = HomeRoadSectionView(origin: getOrigin(), direction: getCurrentDirection(), corner: getCorner())
        roadSectionView.layer.zPosition = 10
        append(section: roadSectionView)
    }

    private func createGrassBackground() {
        let backgroundImageView = UIImageView(image: UIImage(named: "Grass.jpg"))
        backgroundImageView.frame = self.frame
        self.addSubview(backgroundImageView)
    }

    private func createBus() {
        busView = BusView()
        busView.layer.zPosition = 100
        addSubview(busView)
    }

    public func moveBusForward() {
        animationQueue.addAnimation {
            self.busPosition += 1
            if let origin = self.getSectionOrigin(at: self.busPosition) {
                let x = Int(origin.x) + Constants.sectionSize / 2 - Constants.busWidth / 2
                let y = Int(origin.y) + Constants.sectionSize / 2 - Constants.busHeight / 2
                let nextPosition = CGPoint(x: x, y: y)

                self.busView.transform = self.getTransform()

                self.busView.frame = CGRect(origin: nextPosition, size: Constants.busSize)
                self.busView.bounds = CGRect(origin: nextPosition, size: Constants.busSize)
            }
        }
    }

    public func stopBus() {
        animationQueue.addPause()
    }

    private func getTransform() -> CGAffineTransform {
        if let direction = getSectionDirection(at: busPosition) {
            switch direction {
            case .right:
                if let corner = getSectionCorner(at: busPosition) {
                    switch corner {
                    case UIRectCorner.topRight, UIRectCorner.bottomLeft:
                        return CGAffineTransform(rotationAngle: .pi / 4)
                    default:
                        return CGAffineTransform(rotationAngle: 0)
                    }
                }
                return CGAffineTransform(rotationAngle: 0)
            case .downRight:
                return CGAffineTransform(rotationAngle: .pi/2)
            case .left:
                if let corner = getSectionCorner(at: busPosition) {
                    switch corner {
                    case UIRectCorner.topLeft, UIRectCorner.bottomRight:
                        return CGAffineTransform(rotationAngle: 3 * .pi / 4)
                    default:
                        return CGAffineTransform(rotationAngle: .pi)
                    }
                }
                return CGAffineTransform(rotationAngle: .pi)
            case .downLeft:
                return CGAffineTransform(rotationAngle: .pi/2)
            }
        }
        return CGAffineTransform(rotationAngle: 0)
    }

    private func getSectionOrigin(at position: Int) -> CGPoint? {
        if (position < roadSections.count) {
            return roadSections[position].frame.origin
        }
        return nil
    }

    private func getSectionCorner(at position: Int) -> UIRectCorner? {
        if (position < roadSections.count) {
            return roadSections[position].corner
        }
        return nil
    }

    private func getSectionDirection(at position: Int) -> Direction? {
        if (position < roadSections.count) {
            return roadSections[position].direction
        }
        return nil
    }

    private func append(section: RoadSectionView) {
        addSubview(section)
        roadSections.append(section)
        calculateNextPosition()
    }

    private func calculateNextPosition() {
        x += 1
        switch getCurrentDirection()  {
        case .downLeft, .downRight:
            moveToNextLine()
        case .left, .right:
            if (x >= Constants.lineLength) {
                moveToNextLine()
            }
        }
    }

    private func moveToNextLine() {
        currentDirectionIndex = (currentDirectionIndex + 1) % 4
        x = 0
        y += 1
    }

    private func getOrigin() -> CGPoint {
        var xPos = 0
        let yPos = y * Constants.sectionSize

        switch getCurrentDirection() {
        case .downLeft:
            xPos = 0
        case .downRight:
            xPos = (Constants.lineLength - 1) * Constants.sectionSize
        case .left:
            xPos = (Constants.lineLength - 1 - x) * Constants.sectionSize
        case .right:
            xPos = x * Constants.sectionSize
        }
        return CGPoint(x: xPos, y: yPos)
    }

    private func getCurrentDirection() -> Direction {
        return directions[currentDirectionIndex]
    }

    private func getCorner() -> UIRectCorner? {
        if x == 0 && y != 1 {
            switch getCurrentDirection() {
            case .left:
                return .bottomRight
            case .right:
                return .bottomLeft
            default:
                return nil
            }
        } else if x == Constants.lineLength - 1 {
            switch getCurrentDirection() {
            case .left:
                return .topLeft
            case .right:
                return .topRight
            default:
                return nil
            }
        }
        return nil
    }
}
