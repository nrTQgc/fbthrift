/*
 * Copyright 2014 Facebook, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
module thrift.async.teventbasemanager;

import thrift.async.teventbase;

// Public D interface

class CppTEventBaseManager {
  this(TEventBaseManager* ebm) {
    ebm_ = ebm;
  }

  CppTEventBase getEventBase() {
    return new CppTEventBase(teventbasemanager_getEventBase(ebm_));
  }

  private:
    TEventBaseManager* ebm_ = null;
}

// C++ logic follows

// C++ Pointers
struct TEventBaseManager;

// C++ interface
extern (C) {
  TEventBase* teventbasemanager_getEventBase(TEventBaseManager*);
}
