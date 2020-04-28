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
          label.font = UIFont(name: "Optima-BOld", size: 16)
          //label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
         
          return label
      }()
    
    lazy var mybutton: UIButton = {
          let button = UIButton()
          button.setImage(UIImage(systemName: "square"), for: .normal)
          self.addSubview(button)
          button.addTarget(self, action: #selector(ButtonPressed), for: .touchUpInside)
          return button
           
      }()

    
    @objc private func ButtonPressed(sender: UIButton!) {
           
        if mybutton.image(for: .normal) == UIImage(systemName: "square") {
            mybutton.setImage(UIImage(systemName: "square.fill"), for: .normal)
        } else {
            mybutton.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }

       
    
    
      private func setTitleConstraint() {
          titleLabel.translatesAutoresizingMaskIntoConstraints = false
          titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
          titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
          titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

      }
    
    private func  setCompletebuttonConstrains() {
        mybutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mybutton.trailingAnchor.constraint(equalTo: trailingAnchor),
        mybutton.widthAnchor.constraint(equalToConstant: 150),
        mybutton.topAnchor.constraint(equalTo: topAnchor), mybutton.heightAnchor.constraint(equalToConstant: 50)])
    }
        


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.initialize()
         contentView.addSubview(titleLabel)
        contentView.addSubview(mybutton)
        setTitleConstraint()
        setCompletebuttonConstrains()
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
        //self.textLabel?.text = nil
       // self.detailTextLabel?.text = nil
    }

}
