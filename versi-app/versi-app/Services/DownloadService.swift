//
//  DownloadService.swift
//  versi-app
//
//  Created by omrobbie on 03/06/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation
import Alamofire

class DownloadService {

    static let instance = DownloadService()

    func downlaodTrendingReposDictArray(completion: @escaping (_ reposDictArray: [Dictionary<String, Any>]) -> ()) {
        var trendingRepoArray = [Dictionary<String, Any>]()
        Alamofire.request(trendingRepoUrl).responseJSON { (response) in
            guard let json = response.result.value as? Dictionary<String, Any> else {return}
            guard let repoDictionaryArray = json["items"] as? [Dictionary<String, Any>] else {return}

            for repoDict in repoDictionaryArray {
                if trendingRepoArray.count < 10 {
                    guard let avatarUrl = repoDict["avatar_url"] as? String,
                        let name = repoDict["name"] as? String,
                        let description = repoDict["description"] as? String,
                        let numberOfForks = repoDict["forks_count"] as? Int,
                        let language = repoDict["language"] as? String,
                        let contributorsUrl = repoDict["contributors_url"] as? String,
                        let ownerDict = repoDict["owner"] as? Dictionary<String, Any>,
                        let repoUrl = repoDict["html_url"] as? String
                        else {
                            break
                    }

                    let repoDictionary: Dictionary<String, Any> = [
                        "avatarUrl": avatarUrl,
                        "name": name,
                        "description": description,
                        "numberOfForks": numberOfForks,
                        "language": language,
                        "contributorsUrl": contributorsUrl,
                        "ownerDict": ownerDict,
                        "repoUrl": repoUrl,
                    ]

                    trendingRepoArray.append(repoDictionary)
                } else {
                    break
                }
            }

            completion(trendingRepoArray)
        }
    }

    func downloadTrendingRepos(completion: @escaping (_ repoArray: [Repo]) -> ()) {
        var reposArray = [Repo]()

        downlaodTrendingReposDictArray { (trendingRepoDictArray) in
            for dict in trendingRepoDictArray {
                let repo = self.downloadTrendingRepo(fromDictionary: dict)
                reposArray.append(repo)
            }

            completion(reposArray)
        }
    }

    func downloadTrendingRepo(fromDictionary dict: Dictionary<String, Any>) -> Repo {
        //        let avatarUrl = dict["avatar_url"] as! String
        let name = dict["name"] as! String
        let description = dict["description"] as! String
        let numberOfForks = dict["forks_count"] as! Int
        //        let language = dict["language"] as! String
        //        let numberOfContributors = dict[""]
        let repoUrl = dict["html_url"] as! String

        let repo = Repo(image: UIImage(named: "searchIconLarge")!, name: name, description: description, numberOfForks: numberOfForks, language: "language", numberOfContributors: 123, repoUrl: repoUrl)

        return repo
    }
}
