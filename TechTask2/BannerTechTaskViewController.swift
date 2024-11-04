//
//  BannerTechTaskViewController.swift
//  TechTask2
//
//  Created by Vladimir Vinakheras on 31.10.2024.
//
import UIKit

class BannerTechTaskViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Asset.Texts.bannerTitleText
        label.font = UIFont(name: Asset.Fonts.titleBannerFont, size: 17)
        label.textColor = Asset.Colors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        guard let labelFont = UIFont(name: Asset.Fonts.subtitleBannerFont, size: 13),
              let labelColor = Asset.Colors.textColor?.withAlphaComponent(0.5) else { return UILabel() }

        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.4
        let attributedText = NSAttributedString(
            string: Asset.Texts.bannerSubtitleText,
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: labelFont,
                .foregroundColor: labelColor
            ]
        )
        label.attributedText = attributedText

        return label
    }()

    private let images: [UIImage?] = [
        UIImage(named: "Image1"),
        UIImage(named: "Image2"),
        UIImage(named: "Image3"),
        UIImage(named: "Image4")
    ]

    private lazy var overlayCircle: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.backgroundColor = .white
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurView)

        return view
    }()

    private lazy var imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textStackView, imageStackView])
        stackView.axis = .horizontal
        stackView.spacing = 19
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.backgroundColor
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        activateConstraints()
    }

    private func setupView() {
        view.addSubview(containerView)
        containerView.addSubview(mainStackView)
        let images = images.compactMap { $0 }
        let column1StackView = createColumnStackView(with: Array(images.prefix(2)))
        let column2StackView = createColumnStackView(with: Array(images.suffix(2)))

        imageStackView.addArrangedSubview(column1StackView)
        imageStackView.addArrangedSubview(column2StackView)
    }

    private func createColumnStackView(with images: [UIImage]) -> UIStackView {
        let columnStackView = UIStackView()
        columnStackView.axis = .vertical
        columnStackView.spacing = 6
        columnStackView.alignment = .fill
        columnStackView.distribution = .fillProportionally
        columnStackView.translatesAutoresizingMaskIntoConstraints = false

        for (index, image) in images.enumerated() {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 3
            imageView.layer.borderWidth = 2
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.clipsToBounds = true
            columnStackView.addArrangedSubview(imageView)

            if index == 0 && images.count == 2 {
                let sunPosX = image.size.width*0.21
                let sunPosy = image.size.height*0.17
                let sunRadius = image.size.height*0.26
                 imageView.addSubview(overlayCircle)
                NSLayoutConstraint.activate([
                    overlayCircle.widthAnchor.constraint(equalToConstant: sunRadius ),
                    overlayCircle.heightAnchor.constraint(equalToConstant: sunRadius),
                    overlayCircle.topAnchor.constraint(equalTo: imageView.topAnchor, constant: sunPosy),
                    overlayCircle.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: sunPosX)
                ])
            }
        }

        return columnStackView
    }

    func activateConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -14),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
    }
}
