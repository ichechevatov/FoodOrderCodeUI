//
//  TransitionAnimationTest.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 07.04.2021.
//

import Foundation
import  UIKit

//MARK:-ANIMATION

class  ContrDelegat: NSObject, UIViewControllerTransitioningDelegate {
    var cell: UICollectionViewCell!
    init(cell : UICollectionViewCell) {
        self.cell = cell
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PressContrl(presentedViewController: presented, presenting: presenting)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionAnimator(cell: cell)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionAnimator(cell: cell)
    }
}

class PressContrl: UIPresentationController{
    var dimm: UIView!
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let container = containerView else {return CGRect.zero}
        let rect = CGRect(x: 0, y: (container.frame.height)/5, width: containerView!.frame.width, height: ((container.frame.height) - container.frame.height/5) )
        print("1")
        return rect
    }
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentedViewController)
        print("2")
        dimmSetup()
    }
    
    func dimmSetup(){
        print("3")
        dimm = UIView()
        dimm.backgroundColor = .black
        dimm.alpha = 0.8
        dimm.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
//        <#code#>
//    }
    
    override func presentationTransitionWillBegin() {
        print("4")
        containerView?.insertSubview(dimm, at: 0)
        //containerView?.addSubview(dimm)
        
        NSLayoutConstraint.activate([//dimm.centerXAnchor.constraint(equalTo: containerView!.centerXAnchor),
                                     //dimm.centerYAnchor.constraint(equalTo: containerView!.centerYAnchor),
                                     dimm.heightAnchor.constraint(equalTo: containerView!.heightAnchor),
                                     dimm.widthAnchor.constraint(equalTo: containerView!.widthAnchor)])
        
//       let coordinator = presentedViewController.transitionCoordinator
//        coordinator?.animate(alongsideTransition: <#T##((UIViewControllerTransitionCoordinatorContext) -> Void)?##((UIViewControllerTransitionCoordinatorContext) -> Void)?##(UIViewControllerTransitionCoordinatorContext) -> Void#>, completion: <#T##((UIViewControllerTransitionCoordinatorContext) -> Void)?##((UIViewControllerTransitionCoordinatorContext) -> Void)?##(UIViewControllerTransitionCoordinatorContext) -> Void#>)
        
        //плавноее появление затемнения??
    }
    
    override func containerViewWillLayoutSubviews() {
        
        print("5")
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
}

class TransitionAnimator: NSObject,  UIViewControllerAnimatedTransitioning {
    let cell: UICollectionViewCell
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 5
    }
    
    init(cell: UICollectionViewCell) {
        self.cell = cell
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let key = UITransitionContextViewControllerKey.to
        let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: key)!)
    
        let controller = transitionContext.viewController(forKey: key)
        
    
        
        
        let snap = cell.snapshotView(afterScreenUpdates: false)
       
        controller?.view.addSubview(snap!)
      
        
        
        transitionContext.containerView.addSubview((controller?.view)!)
        
        controller?.view.frame = cell.frame
        
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            
            controller?.view.frame = finalFrame
            
            snap?.frame = (controller?.view.bounds)!
        } completion: { (finished) in
            transitionContext.completeTransition(finished)
            snap?.removeFromSuperview()
            
        }

        
        
        
    }
    
   
    
    
}
