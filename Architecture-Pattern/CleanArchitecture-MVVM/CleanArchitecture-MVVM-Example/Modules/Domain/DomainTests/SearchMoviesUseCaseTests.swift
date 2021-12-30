//
//  SearchMoviesUseCaseTests.swift
//  CodeChallengeTests
//
//  Created by Oleh Kudinov on 01.10.18.
//

import XCTest
import Common
@testable import Domain

class SearchMoviesUseCaseTests: XCTestCase {

    static var moviesPages: [MoviesPage] {
        let page1 = MoviesPage(page: 1, totalPages: 2, movies: [
            Movie(id: 1, title: "title1", posterPath: "/1", overview: "overview1", releaseDate: nil),
            Movie(id: 2, title: "title2", posterPath: "/2", overview: "overview2", releaseDate: nil)])
        let page2 = MoviesPage(page: 2, totalPages: 2, movies: [
            Movie(id: 3, title: "title3", posterPath: "/3", overview: "overview3", releaseDate: nil)])
        return [page1, page2]
    }

    enum MoviesRepositorySuccessTestError: Error {
        case failedFetching
    }

    class MoviesQueriesRepositoryMock: MoviesQueriesRepository {
        var recentQueries: [MovieQuery] = []
        func recentsQueries(number: Int) -> [MovieQuery] {
            return recentQueries
        }
        func saveRecentQuery(query: MovieQuery) {
            recentQueries.append(query)
        }
    }

    class MoviesRepositorySuccessMock: MoviesRepository {
        func moviesList(query: MovieQuery, page: Int, with result: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable? {
            result(.success(SearchMoviesUseCaseTests.moviesPages[0]))
            return nil
        }
    }

    class MoviesRepositoryFailureMock: MoviesRepository {
        func moviesList(query: MovieQuery, page: Int, with result: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable? {
            result(.failure(MoviesRepositorySuccessTestError.failedFetching))
            return nil
        }
    }

    func testSearchMoviesUseCase_whenSuccessfullyFetchesMoviesForQuery_thenQueryIsSavedInRecentQueries() {
        // given
        let expectation = self.expectation(description: "Recent query saved")
        let moviesQueriesRepository = MoviesQueriesRepositoryMock()
        let useCase = DefaultSearchMoviesUseCase(moviesRepository: MoviesRepositorySuccessMock(),
                                                  moviesQueriesRepository: moviesQueriesRepository)

        // when
        let requestValue = SearchMoviesUseCaseRequestValue(query: MovieQuery(query: "title1"),
                                                                                     page: 0)
        _ = useCase.execute(requestValue: requestValue) { movies in
            expectation.fulfill()
        }
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(moviesQueriesRepository.recentsQueries(number: 1).contains(MovieQuery(query: "title1")))
    }

    func testSearchMoviesUseCase_whenFailedFetchingMoviesForQuery_thenQueryIsNotSavedInRecentQueries() {
        // given
        let expectation = self.expectation(description: "Recent query saved")
        let moviesQueriesRepository = MoviesQueriesRepositoryMock()
        let useCase = DefaultSearchMoviesUseCase(moviesRepository: MoviesRepositoryFailureMock(),
                                                moviesQueriesRepository: moviesQueriesRepository)

        // when
        let requestValue = SearchMoviesUseCaseRequestValue(query: MovieQuery(query: "title1"),
                                                          page: 0)
        _ = useCase.execute(requestValue: requestValue) { movies in
            expectation.fulfill()
        }
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(moviesQueriesRepository.recentsQueries(number: 1).isEmpty)
    }
}
