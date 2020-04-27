//
//  ToDoTableViewCell.swift
//  createToDoList
//
//  Created by Kary Martinez on 4/24/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont(name: "Optima-BOld", size: 24)
          label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
          label.addSubview(label)
          return label
      }()

      private func setTitleConstraint() {
          titleLabel.translatesAutoresizingMaskIntoConstraints = false
          titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
          titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
          titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

      }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.initialize()
        setTitleConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    func initialize() {
      
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.contentView.backgroundColor = .white
        self.titleLabel.textColor = .black
        self.textLabel?.text = nil
        self.detailTextLabel?.text = nil
    }

}
