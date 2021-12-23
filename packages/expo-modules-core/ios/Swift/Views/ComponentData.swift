// Copyright 2021-present 650 Industries. All rights reserved.

import React

@objc(EXComponentData)
public final class ComponentData: RCTComponentData {
  override public func createPropBlock(_ name: String, isShadowView: Bool) -> RCTPropBlockAlias {
    super.createPropBlock(name, isShadowView: isShadowView)
  }
}
