//
//  NetworkServiceTests.swift
//  ExampleMVVMTests
//
//  Created by Oleh Kudinov on 16.08.19.
//

import XCTest
import Networking

class NetworkServiceTests: XCTestCase {
    
    private struct EndpointMock: Requestable {
        var path: String
        var isFullPath: Bool = false
        var method: HTTPMethodType
        var queryParameters: [String: Any] = [:]
        var headerParamaters: [String: String] = [:]
        var bodyParamaters: [String: Any] = [:]
        var bodyEncoding: BodyEncoding = .stringEncodingAscii
        
        init(path: String, method: HTTPMethodType) {
            self.path = path
            self.method = method
        }
    }
    
    class NetworkErrorLoggerMock: NetworkErrorLogger {
        var loggedErrors: [Error] = []
        func log(request: URLRequest) { }
        func log(responseData data: Data?, response: URLResponse?) { }
        func log(error: Error) { loggedErrors.append(error) }
        func log(statusCode: Int) { }
    }
    
    private enum NetworkErrorMock: Error {
        case someError
    }

    func test_whenMockDataPassed_shouldReturnProperResponse() {
        //given
        let config = NetworkConfigurableMock()
        let expectation = self.expectation(description: "Should return correct data")
        
        let expectedResponseData = "Response data".data(using: .utf8)!
        let sut = DefaultNetworkService(session: NetworkSessionMock(response: nil,
                                                                    data: expectedResponseData,
                                                                    error: nil),
                                        config: config)
        //when
        _ = sut.request(endpoint: EndpointMock(path: "http://mock.test.com", method: .get)) { result in
            guard let responseData = try? result.get() else {
                XCTFail("Should return proper response")
                return
            }
            XCTAssertEqual(responseData, expectedResponseData)
            expectation.fulfill()
        }
        //then
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_whenErrorWithNSURLErrorCancelledReturned_shouldNotCallCompletionBlock_() {
        //given
        let config = NetworkConfigurableMock()
        let expectation = self.expectation(description: "Should return hasStatusCode error")
        
        let cancelledError = NSError(domain: "network", code: NSURLErrorCancelled, userInfo: nil)
        let response = HTTPURLResponse(url: URL(string: "test_url")!,
                                       statusCode: 200,
                                       httpVersion: "1.1",
                                       headerFields: [:])
        let sut = DefaultNetworkService(session: NetworkSessionMock(response: response,
                                                                    data: nil,
                                                                    error: cancelledError as Error),
                                        config: config)
        //when
        _ = sut.request(endpoint: EndpointMock(path: "http://mock.test.com", method: .get)) { result in
            do {
                _ = try result.get()
                XCTFail("Should not happen")
            } catch let error {
                guard case NetworkError.cancelled = error else {
                    XCTFail("NetworkError.cancelled not found")
                    return
                }
                
                expectation.fulfill()
            }
        }
        //then
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_whenMalformedUrlPassed_shouldReturnUrlGenerationError() {
        //given
        let config = NetworkConfigurableMock()
        let expectation = self.expectation(description: "Should return correct data")
        
        let expectedResponseData = "Response data".data(using: .utf8)!
        let sut = DefaultNetworkService(session: NetworkSessionMock(response: nil,
                                                                    data: expectedResponseData,
                                                                    error: nil),
                                        config: config)
        //when
        _ = sut.request(endpoint: EndpointMock(path: "-;@,?:ą", method: .get)) { result in
            do {
                _ = try result.get()
                XCTFail("Should throw url generation error")
            } catch let error {
                guard case NetworkError.urlGeneration = error else {
                    XCTFail("Should throw url generation error")
                    return
                }
                
                expectation.fulfill()
            }
        }
        //then
        wait(for: [expectation], timeout: 0.1)
    }

    func test_whenStatusCodeEqualOrAbove400_shouldReturnhasStatusCodeError() {
        //given
        let config = NetworkConfigurableMock()
        let expectation = self.expectation(description: "Should return hasStatusCode error")
        
        let response = HTTPURLResponse(url: URL(string: "test_url")!,
                                       statusCode: 500,
                                       httpVersion: "1.1",
                                       headerFields: [:])
        let sut = DefaultNetworkService(session: NetworkSessionMock(response: response,
                                                                    data: nil,
                                                                    error: NetworkErrorMock.someError),
                                        config: config)
        //when
        _ = sut.request(endpoint: EndpointMock(path: "http://mock.test.com", method: .get)) { result in
            do {
                _ = try result.get()
                XCTFail("Should not happen")
            } catch let error {
                if case NetworkError.errorStatusCode(let statusCode) = error {
                    XCTAssertEqual(statusCode, 500)
                    expectation.fulfill()
                }
            }
        }
        //then
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_whenErrorWithNSURLErrorNotConnectedToInternetReturned_shouldReturnNotConnectedError() {
        //given
        let config = NetworkConfigurableMock()
        let expectation = self.expectation(description: "Should return hasStatusCode error")
        
        let error = NSError(domain: "network", code: NSURLErrorNotConnectedToInternet, userInfo: nil)
        let response = HTTPURLResponse(url: URL(string: "test_url")!,
                                       statusCode: 200,
                                       httpVersion: "1.1",
                                       headerFields: [:])
        let sut = DefaultNetworkService(session: NetworkSessionMock(response: response,
                                                                    data: nil,
                                                                    error: error as Error),
                                        config: config)
        
        //when
        _ = sut.request(endpoint: EndpointMock(path: "http://mock.test.com", method: .get)) { result in
            do {
                _ = try result.get()
                XCTFail("Should not happen")
            } catch let error {
                guard case NetworkError.notConnected = error else {
                    XCTFail("NetworkError.cancelled not found")
                    return
                }
                
                expectation.fulfill()
            }
        }
        //then
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_whenhasStatusCodeUsedWithWrongError_shouldReturnFalse() {
        //when
        let sut = NetworkError.notConnected
        //then
        XCTAssertFalse(sut.hasStatusCode(200))
    }

    func test_whenhasStatusCodeUsed_shouldReturnCorrectStatusCode_() {
        //when
        let sut = NetworkError.errorStatusCode(statusCode: 400)
        //then
        XCTAssertTrue(sut.hasStatusCode(400))
        XCTAssertFalse(sut.hasStatusCode(399))
        XCTAssertFalse(sut.hasStatusCode(401))
    }
    
    func test_whenErrorWithNSURLErrorNotConnectedToInternetReturned_shouldLogThisError() {
        //given
        let config = NetworkConfigurableMock()
        let expectation = self.expectation(description: "Should return hasStatusCode error")
        
        let error = NSError(domain: "network", code: NSURLErrorNotConnectedToInternet, userInfo: nil)
        let response = HTTPURLResponse(url: URL(string: "test_url")!,
                                       statusCode: 200,
                                       httpVersion: "1.1",
                                       headerFields: [:])
        let networkErrorLogger = NetworkErrorLoggerMock()
        let sut = DefaultNetworkService(session: NetworkSessionMock(response: response,
                                                                    data: nil,
                                                                    error: error as Error),
                                        config: config,
                                        logger: networkErrorLogger)
        //when
        _ = sut.request(endpoint: EndpointMock(path: "http://mock.test.com", method: .get)) { result in
            do {
                _ = try result.get()
                XCTFail("Should not happen")
            } catch let error {
                guard case NetworkError.notConnected = error else {
                    XCTFail("NetworkError.cancelled not found")
                    return
                }
                
                expectation.fulfill()
            }
        }
        
        //then
        wait(for: [expectation], timeout: 0.1)
        XCTAssertTrue(networkErrorLogger.loggedErrors.contains(where: {
            ($0 as NSError).code == NSURLErrorNotConnectedToInternet
        }))
    }
}
