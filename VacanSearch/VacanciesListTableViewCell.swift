//
//  VacanciesListTableViewCell.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 15.11.2023.
//

import UIKit

private enum Constants {
    static let logoSize: CGFloat = 70
    
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
        
        setupCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private lazy var vacancyCardView: UIStackView = {
        let card = UIStackView()
        
        card.backgroundColor = .secondarySystemGroupedBackground
        card.layer.cornerRadius = Constants.cornerRadius
        card.layer.borderColor = UIColor.separator.cgColor
        card.layer.borderWidth = 0.5
        
        card.axis = .vertical
        card.alignment = .center
        card.spacing = Constants.spacing * 2
        
        return card
    }()
    
    private lazy var mainInfoBlockView = UIView()
    
    private lazy var mainInfoStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = Constants.spacing
        
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: Constants.padding, left: Constants.padding, bottom: Constants.padding, right: Constants.padding)
        
        return stack
    }()
    
    private lazy var companyLogo: UIImageView = {
        let logo = UIImageView()
        
        logo.layer.cornerRadius = Constants.logoSize / 2
        logo.layer.masksToBounds = true
        logo.contentMode = .scaleAspectFit
        
        logo.layer.borderColor = UIColor.separator.cgColor
        logo.layer.borderWidth = 0.5
        
        return logo
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
        stack.layoutMargins = UIEdgeInsets(top: 0, left: Constants.padding, bottom: Constants.padding, right: Constants.padding)
        
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
        
        if companyLogo.image != nil {
            companyLogo.image = nil
            companyLogo.removeFromSuperview()
            mainInfoBlockView.removeFromSuperview()
        }
        
        mainInfoStackView.removeFromSuperview()
        
        salaryLabel.text = nil
        salaryLabel.removeFromSuperview()
        
        separator.removeFromSuperview()
        requirementInfoStackView.removeFromSuperview()
        responsibilityInfoStackView.removeFromSuperview()
        
        mainInfoStackView.layoutMargins.bottom = Constants.padding
        requirementInfoStackView.layoutMargins.bottom = Constants.padding
        responsibilityInfoStackView.layoutMargins.bottom = 0
    }
    
    private func setupCard() {
        contentView.backgroundColor = .systemGroupedBackground
        
        [
            vacancyCardView,
            mainInfoStackView,
            mainInfoBlockView,
            companyLogo,
            nameLabel,
            salaryLabel,
            companyLabel,
            separator,
            requirementInfoStackView,
            requirementLabel,
            responsibilityInfoStackView,
            responsibilityLabel
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        contentView.addSubview(vacancyCardView)
        
        NSLayoutConstraint.activate([
            vacancyCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding / 2),
            vacancyCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            vacancyCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),
            vacancyCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.padding / 2),
        ])
    }
    
    private func setupMainInfoStackView(salary: SalaryModel?) {
        mainInfoStackView.addArrangedSubview(nameLabel)
        
        if let salary {
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
    }
    
    private func setupLogoView(with logo: UIImage?, hasAdditionalInfo: Bool) {
        companyLogo.image = logo
        
        mainInfoBlockView.addSubview(companyLogo)
        mainInfoBlockView.addSubview(mainInfoStackView)
        
        vacancyCardView.addArrangedSubview(mainInfoBlockView)
        
        NSLayoutConstraint.activate([
            mainInfoBlockView.widthAnchor.constraint(equalTo: vacancyCardView.widthAnchor),
            
            companyLogo.heightAnchor.constraint(equalToConstant: Constants.logoSize),
            companyLogo.widthAnchor.constraint(equalTo: companyLogo.heightAnchor),
            companyLogo.leadingAnchor.constraint(equalTo: mainInfoBlockView.leadingAnchor, constant: Constants.padding),
            companyLogo.trailingAnchor.constraint(equalTo: mainInfoStackView.leadingAnchor),
            companyLogo.topAnchor.constraint(greaterThanOrEqualTo: mainInfoBlockView.topAnchor, constant: Constants.padding),
            companyLogo.centerYAnchor.constraint(
                equalTo: mainInfoBlockView.centerYAnchor,
                constant: hasAdditionalInfo ? Constants.padding / 2 : 0
            ),
            
            mainInfoStackView.centerYAnchor.constraint(equalTo: mainInfoBlockView.centerYAnchor),
            mainInfoStackView.heightAnchor.constraint(lessThanOrEqualTo: mainInfoBlockView.heightAnchor),
            mainInfoStackView.trailingAnchor.constraint(equalTo: mainInfoBlockView.trailingAnchor),
        ])
    }
    
    private func setupAdditionalInfo(requirement: String?, responsibility: String?) {
        vacancyCardView.addArrangedSubview(separator)
        mainInfoStackView.layoutMargins.bottom = 0
        
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 0.7),
            separator.widthAnchor.constraint(equalTo: vacancyCardView.widthAnchor, multiplier: 0.6),
            separator.centerXAnchor.constraint(equalTo: vacancyCardView.centerXAnchor),
        ])
        
        if let requirement {
            requirementLabel.text = requirement
            vacancyCardView.addArrangedSubview(requirementInfoStackView)
            
            requirementInfoStackView.widthAnchor.constraint(equalTo: vacancyCardView.widthAnchor).isActive = true
        }
        
        if let responsibility {
            responsibilityLabel.text = responsibility
            vacancyCardView.addArrangedSubview(responsibilityInfoStackView)
            
            requirementInfoStackView.layoutMargins.bottom = Constants.spacing
            responsibilityInfoStackView.layoutMargins.bottom = Constants.padding
            
            responsibilityInfoStackView.widthAnchor.constraint(equalTo: vacancyCardView.widthAnchor).isActive = true
        }
    }
    
    func configure(with model: VacancyListCellModel) {
        let hasAdditionalInfo = model.requirement != nil || model.responsibility != nil
        
        nameLabel.text = model.name
        companyLabel.text = model.employerName
        
        setupMainInfoStackView(salary: model.salary)
        
        if model.employerLogoImage != nil || model.employerLogoUrl != nil {
            setupLogoView(with: model.employerLogoImage, hasAdditionalInfo: hasAdditionalInfo)
        } else {
            vacancyCardView.addArrangedSubview(mainInfoStackView)
            mainInfoStackView.widthAnchor.constraint(equalTo: vacancyCardView.widthAnchor).isActive = true
        }
        
        if hasAdditionalInfo {
            setupAdditionalInfo(requirement: model.requirement, responsibility: model.responsibility)
        }
    }
    
    func setSelected() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }
            self.vacancyCardView.backgroundColor = .tertiarySystemFill
        }
    }
    
    func deselect() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }
            self.vacancyCardView.backgroundColor = .secondarySystemGroupedBackground
        }
    }
}
