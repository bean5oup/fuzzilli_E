// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Fuzzilli

public struct Profile {
    public let processArgs: (_ randomize: Bool) -> [String]
    public let processEnv: [String : String]
    public let maxExecsBeforeRespawn: Int
    // Timeout is in milliseconds.
    public let timeout: Int
    public let codePrefix: String
    public let codeSuffix: String
    public let ecmaVersion: ECMAScriptVersion

    // JavaScript code snippets that are executed at startup time to ensure that Fuzzilli and the target engine are configured correctly.
    public let startupTests: [(String, ExpectedStartupTestResult)]

    public let additionalCodeGenerators: [(CodeGenerator, Int)]
    public let additionalProgramTemplates: WeightedList<ProgramTemplate>

    public let disabledCodeGenerators: [String]
    public let disabledMutators: [String]

    public let additionalBuiltins: [String: ILType]
    public let additionalObjectGroups: [ObjectGroup]

    // An optional post-processor that is executed for every sample generated for fuzzing and can modify it.
    public let optionalPostProcessor: FuzzingPostProcessor?
}

public let profiles = [
    "qtjs": qtjsProfile,
    "qjs": qjsProfile,
    "jsc": jscProfile,
    "spidermonkey": spidermonkeyProfile,
    "v8": v8Profile,
    "duktape": duktapeProfile,
    "jerryscript": jerryscriptProfile,
    "xs": xsProfile,
    "v8holefuzzing": v8HoleFuzzingProfile,
    "serenity": serenityProfile,
    "crextensions": crextensionsProfile,
]
