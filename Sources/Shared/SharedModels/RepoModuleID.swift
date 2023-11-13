//
//  RepoModuleID.swift
//
//
//  Created by ErrorErrorError on 6/2/23.
//
//

@_exported
import DatabaseClient
import Foundation
import Tagged

public struct RepoModuleID: Hashable, Sendable {
    public let repoId: Repo.ID
    public let moduleId: Module.ID
}

public extension RepoModuleID {
    static func create(_ repo: Repo, _ module: Module) -> RepoModuleID {
        .init(repoId: repo.id, moduleId: module.id)
    }
}

public extension Repo {
    func id(_ moduleID: Module.ID) -> RepoModuleID {
        .init(repoId: id, moduleId: moduleID)
    }

    func id(_ module: Module.Manifest) -> RepoModuleID {
        self.id(module.id)
    }
}

public extension Module {
    func id(repoID: Repo.ID) -> RepoModuleID {
        .init(repoId: repoID, moduleId: id)
    }
}

public extension Module.Manifest {
    func id(repoID: Repo.ID) -> RepoModuleID {
        .init(repoId: repoID, moduleId: id)
    }
}
