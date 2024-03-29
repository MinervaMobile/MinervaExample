//
// Copyright © 2020 Optimize Fitness Inc.
// Licensed under the MIT license
// https://github.com/OptimizeFitness/Minerva/blob/master/LICENSE
//

import Foundation
import MinervaCoordinator
import MinervaExtensions
import MinervaList
import RxRelay
import RxSwift
import UIKit

public final class UserListPresenter: ListPresenter {
  // TODO: Update the old presenter to use the new persistent / transient state model
  public var sections = BehaviorRelay<[ListSection]>(value: [])

  public enum Action {
    case delete(user: User)
    case edit(user: User)
    case view(user: User)
  }

  public enum State {
    case loading
    case failure(error: Error)
    case loaded(sections: [ListSection])
  }

  public private(set) var state: Observable<State>
  public var actions: Observable<Action> {
    actionsRelay.asObservable()
  }

  private let actionsRelay: PublishRelay<Action>
  private let repository: UserListRepository

  // MARK: - Lifecycle

  public init(repository: UserListRepository) {
    self.repository = repository
    self.actionsRelay = PublishRelay()
    self.state = Observable.just(.loading)
    self.state = state.concat(
      repository.users.map { [weak self] usersResult -> State in
        guard let strongSelf = self else {
          return .failure(error: SystemError.cancelled)
        }
        switch usersResult {
        case let .success(users):
          let sections = [strongSelf.createSection(with: users.sorted { $0.email < $1.email })]
          strongSelf.sections.accept(sections)
          return .loaded(sections: sections)
        case let .failure(error):
          return .failure(error: error)
        }
      }
    )
  }

  // MARK: - Private

  private func createSection(with users: [User]) -> ListSection {
    var cellModels = [ListCellModel]()

    let allowSelection = repository.allowSelection
    for user in users {
      let userCellModel = createUserCellModel(for: user)
      if allowSelection {
        userCellModel.selectionAction = { [weak self] model, _ in
          guard let strongSelf = self else { return }
          strongSelf.actionsRelay.accept(.view(user: model.user))
        }
      }
      cellModels.append(userCellModel)
    }

    let section = ListSection(cellModels: cellModels, identifier: "SECTION")
    return section
  }

  private func createUserCellModel(for user: User) -> UserListCellModel {
    let cellModel = UserListCellModel(user: user)
    cellModel.deleteAction = { [weak self] _ -> Void in
      guard let strongSelf = self else { return }
      strongSelf.actionsRelay.accept(.delete(user: user))
    }
    return cellModel
  }
}
