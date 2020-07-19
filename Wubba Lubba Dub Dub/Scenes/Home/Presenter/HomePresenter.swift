//
//  HomeHomePresenter.swift
//  Wubba Lubba Dub Dub
//
//  Created by Vince Santos on 14/05/2020.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

    func viewIsReady() {

    }
}
