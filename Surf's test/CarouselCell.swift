
import UIKit

class CarouselCell: UICollectionViewCell {
    
  let button = UIButton()
  
  override init(frame: CGRect) {
    super .init(frame: frame)
    makeButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func makeButton() {
    contentView.addSubview(UIButton())
  }
}
