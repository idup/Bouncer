//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by CS193p Instructor.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior
{
    // 重力
    let gravity = UIGravityBehavior()
    
    // 碰撞
    // 使用lazy的理由：
    // 构造collider的时候有的东西不能使用
    // 构造的时候需要设置属性
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
    }()
    
    // 动力元素行为
    lazy var blockBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedBlockBehavior = UIDynamicItemBehavior()
        // 旋转
        lazilyCreatedBlockBehavior.allowsRotation = true
        // 碰撞类型，即1.0时为弹性碰撞
        lazilyCreatedBlockBehavior.elasticity = 0.85
        lazilyCreatedBlockBehavior.friction = 0
        lazilyCreatedBlockBehavior.resistance = 0
        return lazilyCreatedBlockBehavior
    }()
    
    override init() {
        super.init()
        // addChildBehavior来将其他规则加入到当前规则里
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(blockBehavior)
    }
    
    func addBlock(block: UIView) {
        dynamicAnimator?.referenceView?.addSubview(block)
        gravity.addItem(block)
        collider.addItem(block)
        blockBehavior.addItem(block)
    }
    
    func removeBlock(block: UIView) {
        gravity.removeItem(block)
        collider.removeItem(block)
        blockBehavior.removeItem(block)
        block.removeFromSuperview()
    }
}
