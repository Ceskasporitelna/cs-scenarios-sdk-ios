//
//  CSScenariosSDKTests.swift
//  CSScenariosSDKTests
//
//  Created by František Kratochvíl on 11.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import XCTest
@testable import CSScenariosSDK

fileprivate let testBaseURL = "http://csas-judge.herokuapp.com/webapi";
fileprivate let judgeBaseURL = "http://csas-judge.herokuapp.com";

class CSScenariosSDKTests: XCTestCase {
    
    var client: ScenariosClient!
    var judgeClient: NetworkClient!
    var dateTimeFormatter = DateFormatter()
    
    override func setUp() {
        let config = WebApiConfiguration(webApiKey: "TEST_API_KEY",
                                         environment: Environment.other(value: testBaseURL),
                                         language: "cs-CZ",
                                         authorizationToken: "Bearer token")
        
        self.client = Scenarios(webApiConfiguration: config).client
        
        self.dateTimeFormatter.dateFormat = Scenarios.DateTimeFormat
    }
    
    func prepareTestCase(caseId: String) {
        let expectation = self.expectation(description: "Judge response expectation")
        
        // Setup Judge
        let sessionHeader = NSUUID().uuidString
        judgeClient = NetworkClient(baseUrl: judgeBaseURL)
        judgeClient.addHeader(key: "x-judge-session", value: sessionHeader)
        judgeClient.addHeader(key: "x-judge-case", value: caseId)
        self.client.addHeader(key: "x-judge-session", value: sessionHeader)
        
        // Call judge next case
        judgeClient.callApi(url: "/judge/nextCase", method: .post, object: nil) { (result) in
            switch result {
            case .success:
                print("Test case: '\(caseId)' set")
                expectation.fulfill()
            case .error:
                XCTAssertTrue( false, "Preparing test case failed." )
            }
        }
        
        self.waitForExpectations( timeout: 70.0, handler: { error in
            if ( error != nil ) {
                XCTFail("Expectation Failed with error: \(error!)." )
            }
        });
    }
    
    func testSingleEvent() {
        self.prepareTestCase(caseId: "scenarios.events.post.single")
        let expectation = self.expectation(description: "Response expectation")
        
        let date = dateTimeFormatter.date(from: "2014-02-27T15:45:05+01:00")
        let eventData = Event(eventTypeId: 1,
                              eventType: EventType.loadUri,
                              applicationId: 1,
                              application: "Penize na klik",
                              eventCreation: date,
                              clientId: "2015",
                              values: Values(uri: "www.csas.cz/getAccounts", accounts: [Account(name: "csas")]))
        
        self.client.events.single.post(data: eventData, completion: { (result) in
            switch result {
            case .success:
                expectation.fulfill()
            case .error(let reason):
                XCTAssertTrue( false, "Test case failed: \(reason)" )
            }
        })
        
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testEventCollection() {
        self.prepareTestCase(caseId: "scenarios.events.post.collection")
        let expectation = self.expectation(description: "Response expectation")
        
        let date = dateTimeFormatter.date(from: "2014-02-27T15:45:05+01:00")
        let eventData = Event(eventTypeId: 1,
                             eventType: EventType.loadUri,
                             applicationId: 1,
                             application: "Penize na klik",
                             eventCreation: date,
                             clientId: "2015",
                             values: Values(uri: "www.csas.cz/getAccounts", accounts: [Account(name: "csas")]))
        
        self.client.events.collection.post(data: [eventData], completion: { (result) in
            switch result {
            case .success:
                expectation.fulfill()
            case .error(let reason):
                XCTAssertTrue( false, "Test case failed: \(reason)" )
            }
        })
        
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
}
