// Copyright 2021-present 650 Industries. All rights reserved.

public class Callback<ArgType>: AnyArgument {
  public typealias ClosureType = (ArgType) -> Void


  /**
   Allows the callback instance to be called as a function.
   */
  func callAsFunction(_ arg: ArgType) {

  }
}
