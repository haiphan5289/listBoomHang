
import UIKit
import RxSwift
import RxCocoa
import SwiftyJSON

public protocol CaseIterable {
    associatedtype AllCases: Collection where AllCases.Element == Self
    static var allCases: AllCases { get }
}
extension CaseIterable where Self: Hashable {
    static var allCases: [Self] {
        return [Self](AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            var first: Self?
            return AnyIterator {
                let current = withUnsafeBytes(of: &raw) { $0.load(as: Self.self) }
                if raw == 0 {
                    first = current
                } else if current == first {
                    return nil
                }
                raw += 1
                return current
            }
        })
    }
}
protocol Weakifiable: AnyObject {}
extension Weakifiable {
    func weakify(_ code: @escaping (Self) -> Void) -> () -> Void {
        return { [weak self] in
            guard let self = self else { return }
            code(self)
        }
    }
    
    func weakify<T>(_ code: @escaping (T, Self) -> Void) -> (T) -> Void {
        return { [weak self] arg in
            guard let self = self else { return }
            code(arg, self)
        }
    }
}
extension UIViewController: Weakifiable {}

extension UIView {
    static var identifier: String {
        return "\(self)"
    }
    
    static var nib: UINib? {
        let bundle = Bundle(for: self)
        let name = "\(self)"
        guard bundle.path(forResource: name, ofType: "nib") != nil else {
            return nil
        }
        return UINib(nibName: name, bundle: nil)
    }
    
    func applyShadowAndRadius(sizeX: CGFloat, sizeY: CGFloat,shadowRadius: CGFloat, shadowColor: UIColor) {
        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: sizeX, height: sizeY) //x,
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = shadowRadius //blur
        
        // add the border to subview
        //        let borderView = UIView()
        //        borderView.frame = self.bounds
        //        borderView.layer.cornerRadius = 10
        //
        //        borderView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.16)
        //        borderView.layer.borderWidth = 0.1
        //        borderView.layer.masksToBounds = true
        //        self.addSubview(borderView)
    }
    
    func radiusShadow(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.16)
        self.layer.borderWidth = 0.1
        self.layer.masksToBounds = true
    }
    func clipToBoundAndRadius(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}