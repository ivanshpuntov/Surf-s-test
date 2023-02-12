import UIKit

class ViewController: UIViewController {

  let dataSource = ["iOS", "Android", "Design", "Flutter", "QA", "PM", "Swift", "Kotlin", "Dart", "Git"]
  let mainScrollView = UIScrollView()
  let header = UILabel()
  let subline = UILabel()
  let mainStackView = UIStackView()
  let bottomLabel = UILabel()
  let primaryButton = UIButton()

  
  //TODO: Make horizontal layout
  var carouselCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Set background image
    let backgroundImage = UIImage(named: "SurfBackgroundImage")
    let backgroundImageView = UIImageView(image: backgroundImage)
    
    mainScrollView.frame = view.bounds
    mainScrollView.contentSize = CGSize(width: view.frame.width, height: 1150)
    mainScrollView.showsVerticalScrollIndicator = false
    mainScrollView.bounces = false
    
    mainStackView.axis = .horizontal
    mainStackView.spacing = 16
    mainStackView.distribution = .fillProportionally
    
    let emptyView = UIView()
    emptyView.frame = .init(x: 0, y: 0, width: mainScrollView.bounds.width, height: 450)
    
    //Head view
    let headerView = UIView()
    headerView.backgroundColor = .white
    headerView.frame = .init(x: 0, y: 444, width: mainScrollView.bounds.width, height: 124)
    headerView.layer.cornerRadius = 32
    headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    header.text = "Стажировка в Surf"
    header.textColor = .surfButtonActive
    header.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    headerView.addSubview(header)
    
    
    subline.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
    subline.textColor = .systemGray
    subline.numberOfLines = 0
    subline.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    headerView.addSubview(subline)
    
    //CarouselView
    carouselCollectionView.frame = .init(x: 0, y: 568, width: mainScrollView.bounds.width, height: 62)
    carouselCollectionView.dataSource = self
    carouselCollectionView.register(CarouselCell.self, forCellWithReuseIdentifier: "\(CarouselCell.self)")
    carouselCollectionView.showsVerticalScrollIndicator = false
    carouselCollectionView.showsHorizontalScrollIndicator = false
    
    let bottomEmptyView = UIView()
    bottomEmptyView.backgroundColor = .white
    bottomEmptyView.frame = .init(x: 0, y: carouselCollectionView.frame.maxY, width: mainScrollView.bounds.width, height: 450)
    
    // Set Bottom items
    bottomLabel.text = "Хочешь к нам?"
    bottomLabel.textColor = .systemGray
    bottomLabel.font = UIFont.systemFont(ofSize: 14)
    
    primaryButton.setTitle("Отправить заявку", for: .normal)
    primaryButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    primaryButton.layer.cornerRadius = 26
    primaryButton.clipsToBounds = true
    primaryButton.setTitleColor(.white, for: .normal)
    primaryButton.backgroundColor = .surfButtonActive
    primaryButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    
    //Add subviews
    view.addSubview(backgroundImageView)
    view.addSubview(mainScrollView)
    
    mainScrollView.addSubview(emptyView)
    mainScrollView.addSubview(headerView)
    mainScrollView.addSubview(carouselCollectionView)
    mainScrollView.addSubview(bottomEmptyView)
    mainScrollView.addSubview(mainStackView)
    
    
    mainStackView.addArrangedSubview(bottomLabel)
    mainStackView.addArrangedSubview(primaryButton)
    
    
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    header.translatesAutoresizingMaskIntoConstraints = false
    subline.translatesAutoresizingMaskIntoConstraints = false
    
    header.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
    header.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
    
    subline.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
    subline.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
    subline.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
    subline.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
    
    mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
    mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    mainStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
  }

  @objc func showAlert() {
    let alertTitle = NSLocalizedString("Поздравляем!", comment: "Congratulation alert title")
    let alert = UIAlertController(title: alertTitle, message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
    let actionTitle = NSLocalizedString("Закрыть", comment: "Alert close button title")
    alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    dataSource.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = carouselCollectionView.dequeueReusableCell(withReuseIdentifier: "\(CarouselCell.self)", for: indexPath) as? CarouselCell else {
      return UICollectionViewCell()
    }
    
    cell.backgroundColor = .surfButtonInactive
    
    
    return cell 
  }
}
