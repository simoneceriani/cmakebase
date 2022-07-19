cmake_minimum_required(VERSION 3.24)
project(testUtils)

list(APPEND CMAKE_MODULE_PATH "../../")

include(utils)

printCMakeUtilsDebug("this should NOT be printed")
printCMakeUtilsDebug("this should be printed (FORCED option)" FORCED)

set(CMAKEBASE_DEBUG ON)

printCMakeUtilsDebug("this should be printed")
printCMakeUtilsDebug("this should be printed (FORCED option)" FORCED)
