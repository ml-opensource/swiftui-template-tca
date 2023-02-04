//
//  UseCaseProtocol.swift
//  Domain
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public protocol UseCase {
    associatedtype Input
    associatedtype Output

    func execute(input: Input) async throws -> Output
}

public struct AnyUsecase<Input, Output> {
    private let execute: (_ input: Input) async throws -> Output
    
    public init<Usecase: UseCase>(with usecase: Usecase) where Usecase.Input == Input, Usecase.Output == Output {
        self.execute = usecase.execute
    }
    
    public func execute(input: Input) async throws -> Output {
        return try await execute(input)
    }
}
