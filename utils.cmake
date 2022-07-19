cmake_minimum_required(VERSION 3.24)
include_guard(GLOBAL)

include(options)

#------------------------------------------------------------------------------------------------------------------------------------		
# Print a verbose debug message if CMAKEBASE_DEBUG option is on or if FORCED parameter is passed
# parameters
# - msg: the message to print
# - "FORCED" [optional],
function(printCMakeUtilsDebug msg)
	set(options FORCED)
	cmake_parse_arguments(ARG "${options}" "" "" ${ARGN})	

	if(${ARG_FORCED} OR ${CMAKEBASE_DEBUG})
		MESSAGE(STATUS "${msg}")
	endif()
endfunction()

#------------------------------------------------------------------------------------------------------------------------------------		
# add a value to a global property list if not already present
function(addToGlobalPropertyUnique propertyName newVal)
	get_property(LIST_VALUES GLOBAL PROPERTY ${propertyName})
	if(NOT ${newVal} IN_LIST LIST_VALUES)
		set_property(GLOBAL APPEND PROPERTY ${propertyName} ${newVal})
	endif()
endfunction()

#------------------------------------------------------------------------------------------------------------------------------------		
# add a value to a target property list if not already present
function(addToTargetPropertyUnique targetName propertyName newVal)
	get_target_property(LIST_VALUES ${targetName} ${propertyName})
	if(NOT ${newVal} IN_LIST LIST_VALUES)
		set_property(TARGET ${targetName} APPEND PROPERTY ${propertyName} ${newVal})
	endif()
endfunction()

#------------------------------------------------------------------------------------------------------------------------------------		
# add a value to the current directory property list if not already present
function(addToCurDirPropertyUnique propertyName newVal)
	get_directory_property(LIST_VALUES ${propertyName})
	if(NOT ${newVal} IN_LIST LIST_VALUES)
		set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} APPEND PROPERTY ${propertyName} ${newVal})
	endif()
endfunction()
