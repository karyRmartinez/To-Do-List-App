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
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          setTitleConstraint()
        self.initialize()
          
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    
    func initialize() {
        
    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
