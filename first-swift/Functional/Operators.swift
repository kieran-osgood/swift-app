//
//  Operators.swift
//  first-swift
//
//  Created by Kieran Osgood on 11/08/2023.
//

import Foundation

func double(_ i: Int) -> Int { i * 2 }

precedencegroup ForwardApplication {
  associativity: left
}

infix operator |>: ForwardApplication

func |> <A, B>(a: A, f: (A) -> B) -> B { f(a) }

func test() -> Int {
  2 |> double |> double |> double |> double
}
