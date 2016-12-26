//
//  TestSpec.swift
//  myPlay
//
//  Created by JoHyungeun on 2016. 12. 27..
//  Copyright © 2016년 Keukey. All rights reserved.
//

import Quick
import Nimble

class TestSpec: QuickSpec {
    override func spec() {
        describe("덧셈") {
            var sum: Int = 0
            it("적절히 수행") {
                let a = 3
                let b = 5
                expect(a + b).to(equal(8))
            }
            
            context("만약 합이 음수가 되면") {
                beforeEach {
                    let a = 3
                    let b = -5
                    sum = a + b
                }
                it("양수로 바꿔줌") {
                    sum = -sum
                    expect(sum).to(equal(2))
                }
            }
        }
    }
}
