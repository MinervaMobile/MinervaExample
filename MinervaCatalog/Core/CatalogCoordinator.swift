//
// Copyright © 2020 Optimize Fitness Inc.
// Licensed under the MIT license
// https://github.com/OptimizeFitness/Minerva/blob/master/LICENSE
//

import MinervaCoordinator
import MinervaExtensions
import MinervaList
import RxSwift
import UIKit

public final class CatalogCoordinator: BaseCoordinator<CatalogPresenter, CollectionViewController> {
  public init() {
    let navigator = BasicNavigator(parent: nil)
    let viewController = CollectionViewController()
    viewController.backgroundColor = .systemBackground
    let presenter = CatalogPresenter()
    let listController = LegacyListController()
    super
      .init(
        navigator: navigator,
        viewController: viewController,
        presenter: presenter,
        listController: listController
      )
  }
}
