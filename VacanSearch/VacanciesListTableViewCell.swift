//
//  VacanciesListTableViewCell.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 15.11.2023.
//

import UIKit

private enum Constants {
    static let logoSize: CGFloat = 100
    
    static let cornerRadius: CGFloat = 16
    
    static let padding: CGFloat = 16
    static let spacing: CGFloat = 8
    
    static let smallTextFontSize: CGFloat = 13
    static let mediumTextFontSize: CGFloat = 15
    static let largeTextFontSize: CGFloat = 17
}

class VacanciesListTableViewCell: UITableViewCell {
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    // MARK: - UI Elements
    
    private lazy var vacancyCardView: UIStackView = {
        let card = UIStackView()
        
        card.backgroundColor = .secondarySystemBackground
        card.layer.cornerRadius = Constants.cornerRadius
        card.layer.borderColor = UIColor.separator.cgColor
        card.layer.borderWidth = 1
        
        card.axis = .vertical
        card.alignment = .center
        card.spacing = Constants.spacing * 2

        return card
    }()
    
    private lazy var mainInfoStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = Constants.spacing
        
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: Constants.padding, left: Constants.padding, bottom: Constants.padding, right: Constants.padding)
        
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let name = UILabel()
        
        name.font = UIFont.systemFont(ofSize: Constants.mediumTextFontSize)
        name.textColor = .label
        name.numberOfLines = 0
        
        return name
    }()
    
    private lazy var salaryLabel: UILabel = {
        let salary = UILabel()
        
        salary.font = UIFont.systemFont(ofSize: Constants.largeTextFontSize)
        salary.textColor = .label
        salary.numberOfLines = 0
        
        return salary
    }()
    
    private lazy var companyLabel: UILabel = {
        let company = UILabel()
        
        company.font = UIFont.systemFont(ofSize: Constants.smallTextFontSize)
        company.textColor = .secondaryLabel
        company.numberOfLines = 0
        
        return company
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView()
        
        separator.backgroundColor = .separator
        
        return separator
    }()
    
    private lazy var requirementInfoStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: Constants.padding, bottom: 0, right: Constants.padding)
        
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = Constants.spacing
        
        let header = UILabel()
        header.font = UIFont.italicSystemFont(ofSize: Constants.mediumTextFontSize)
        header.textColor = .label
        header.text = "Требования:"
        header.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(header)
        stack.addArrangedSubview(requirementLabel)
        
        return stack
    }()
    
    private lazy var requirementLabel: UILabel = {
        let requirement = UILabel()
        
        requirement.font = UIFont.systemFont(ofSize: Constants.smallTextFontSize)
        requirement.textColor = .label
        requirement.numberOfLines = 0
        
        return requirement
    }()
    
    private lazy var responsibilityInfoStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: Constants.padding, bottom: 0, right: Constants.padding)
        
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = Constants.spacing
        
        let header = UILabel()
        header.font = UIFont.italicSystemFont(ofSize: Constants.mediumTextFontSize)
        header.textColor = .label
        header.text = "Обязанности:"
        
        stack.addArrangedSubview(header)
        stack.addArrangedSubview(responsibilityLabel)
        
        return stack
    }()
    
    private lazy var responsibilityLabel: UILabel = {
        let responsibility = UILabel()
        
        responsibility.font = UIFont.systemFont(ofSize: Constants.smallTextFontSize)
        responsibility.textColor = .label
        responsibility.numberOfLines = 0
        
        return responsibility
    }()
    
    // MARK: - Setup
    
    override func prepareForReuse() {
        super.prepareForReuse()
                        
        salaryLabel.text = nil
        salaryLabel.removeFromSuperview()
        
        separator.removeFromSuperview()
        requirementInfoStackView.removeFromSuperview()
        responsibilityInfoStackView.removeFromSuperview()
        
        mainInfoStackView.layoutMargins.bottom = Constants.padding
        requirementInfoStackView.layoutMargins.bottom = 0
        responsibilityInfoStackView.layoutMargins.bottom = 0
    }
    
    private func setupUI() {
        contentView.backgroundColor = .systemBackground
        
        [
            vacancyCardView,
            mainInfoStackView,
            nameLabel,
            salaryLabel,
            companyLabel,
            separator,
            requirementInfoStackView,
            requirementLabel,
            responsibilityInfoStackView,
            responsibilityLabel
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        vacancyCardView.addArrangedSubview(mainInfoStackView)
        contentView.addSubview(vacancyCardView)
        
        NSLayoutConstraint.activate([
            vacancyCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding / 2),
            vacancyCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            vacancyCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),
            vacancyCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.padding / 2),
            
            mainInfoStackView.widthAnchor.constraint(equalTo: vacancyCardView.widthAnchor),
        ])
    }
    
    func configure(with model: VacancyListCellModel) {
        nameLabel.text = model.name
        companyLabel.text = model.employerName
        
        mainInfoStackView.addArrangedSubview(nameLabel)
        
        if let salary = model.salary {
            salaryLabel.text = ""
            
            if let from = salary.from { salaryLabel.text?.append("от \(from) ") }
            if let to = salary.to { salaryLabel.text?.append("до \(to) ") }
            if let currency = salary.currency, let currencySymbol = Currency(rawValue: currency)?.getSymbol() {
                salaryLabel.text?.append("\(currencySymbol) ")
            }
            if let gross = salary.gross {
                salaryLabel.text?.append(gross ? "до вычета налогов" : "на руки")
            }
            
            mainInfoStackView.addArrangedSubview(salaryLabel)
        }
        
        mainInfoStackView.addArrangedSubview(companyLabel)
        
        if model.requirement != nil || model.responsibility != nil {
            vacancyCardView.addArrangedSubview(separator)
            
            mainInfoStackView.layoutMargins.bottom = 0
            
            NSLayoutConstraint.activate([
                separator.heightAnchor.constraint(equalToConstant: 1),
                separator.widthAnchor.constraint(equalTo: vacancyCardView.widthAnchor, multiplier: 0.6),
                separator.centerXAnchor.constraint(equalTo: vacancyCardView.centerXAnchor),
            ])
        }
        
        if let requirement = model.requirement {
            requirementLabel.text = requirement
            vacancyCardView.addArrangedSubview(requirementInfoStackView)
            
            requirementInfoStackView.layoutMargins.bottom = Constants.padding
            
            NSLayoutConstraint.activate([
                requirementInfoStackView.widthAnchor.constraint(equalTo: vacancyCardView.widthAnchor),
            ])
        }
        
        if let responsibility = model.responsibility {
            responsibilityLabel.text = responsibility
            vacancyCardView.addArrangedSubview(responsibilityInfoStackView)
            
            requirementInfoStackView.layoutMargins.bottom = Constants.spacing
            responsibilityInfoStackView.layoutMargins.bottom = Constants.padding
            
            NSLayoutConstraint.activate([
                responsibilityInfoStackView.widthAnchor.constraint(equalTo: vacancyCardView.widthAnchor),
            ])
        }
    }
}
