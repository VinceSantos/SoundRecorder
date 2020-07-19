//
//  HomeHomeViewController.swift
//  Wubba Lubba Dub Dub
//
//  Created by Vince Santos on 14/05/2020.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {

    var output: HomeViewOutput!
    var recorderService = AudioRecorderService()
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        recorderService.initializeRecorder()
        setupTableView()
    }


    // MARK: HomeViewInput
    func setupInitialState() {
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: UserPostTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: UserPostTableViewCell.self))
    }
    
    @objc func recordStart(button: UIButton) {
        if recorderService.isRecording {
            button.setImage(UIImage(named: "Record"), for: .normal)
            recorderService.stopRecording()
        } else {
            button.setImage(UIImage(named: "recording"), for: .normal)
            recorderService.startRecording()
        }
    }
    
    @objc func playAudio() {
        recorderService.playAudio()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserPostTableViewCell.self)) as! UserPostTableViewCell
        cell.recordBtn.addTarget(self, action: #selector(recordStart), for: .touchUpInside)
        cell.playBtn.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        return cell
    }
    
    
}
