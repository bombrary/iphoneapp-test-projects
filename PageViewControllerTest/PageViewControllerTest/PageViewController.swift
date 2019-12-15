//
//  PageViewController.swift
//  PageViewControllerTest
//
//  Created by Riku_Yamamoto on 2019/12/14.
//  Copyright © 2019 Riku_Yamamoto. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var controllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        
        let stb = storyboard!
        let page1 = stb.instantiateViewController(withIdentifier: "page1")
        let page2 = stb.instantiateViewController(withIdentifier: "page2")
        let page3 = stb.instantiateViewController(withIdentifier: "page3")
        controllers = [page1, page2, page3]
        
        setViewControllers([controllers[0]], direction: .forward, animated: true, completion: nil)
        dataSource = self
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

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController), index-1 >= 0 {
            return controllers[index-1]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController), index+1 < controllers.count {
            return controllers[index+1]
        } else {
            return nil
        }
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
