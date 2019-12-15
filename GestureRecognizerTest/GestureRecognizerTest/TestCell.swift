//
//  TestCell.swift
//  GestureRecognizerTest
//
//  Created by Riku_Yamamoto on 2019/12/15.
//  Copyright © 2019 Riku_Yamamoto. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    let trashImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "trash")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let overlay: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    let label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemPink
        
        overlay.addSubview(label)
        self.addSubview(trashImage)
        self.addSubview(overlay)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        overlay.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        label.frame = CGRect(x: 20, y: 0, width: overlay.frame.width-20, height: overlay.frame.height)
        trashImage.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        updateTrashSize(20)
    }
    
    func updateTrashSize(_ s: CGFloat) {
        trashImage.frame = CGRect(x: 0, y: 0, width: s, height: s)
        trashImage.layer.position.x = self.frame.width - s
        trashImage.layer.position.y = 40
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          // Configure the view for the selected state
      }
}
