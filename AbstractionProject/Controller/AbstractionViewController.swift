//
//  AbstractionViewController.swift
//  AbstractionProject
//
//  Copyright © 2019 Faerber, Benjamin. All rights reserved.
//

import UIKit

class AbstractionViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    private lazy var orderedAbstractionViews : [UIViewController] =
    {
        return [
            self.newAbstractionViewController(abstractionLevel: "Block"),
            self.newAbstractionViewController(abstractionLevel: "Swift"),
            self.newAbstractionViewController(abstractionLevel: "ByteCode"),
            self.newAbstractionViewController(abstractionLevel: "Binary"),
            self.newAbstractionViewController(abstractionLevel: "LogicalGate")
        ]
    }
    
    private func newAbstractionViewController(abstractionLevel: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController(withIdentifier: "\(abstractionLevel)ViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self

        if let firstViewController = orderedAbstactionViews.first
        {
            setViewController([firstViewController],
                              direction: .forward,
                              animated: true,
                              completion: nil)
        }
    }
    
    // Swipe left
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
            else
        {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0
            else
        {
            return orderedAbstractionViews.last
        }
        
        guard prderedAbstractionViews.count > previousIndex
            else
        {
            return nil
        }
        
        return orderedAbstractionViews[previousIndex]
    }
    
    // Swipe right
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
            else
        {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex >= 0
            else
        {
            return orderedAbstractionViews.first
        }
        
        return orderedAbstractionViews[nextIndex]
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
