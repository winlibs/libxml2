if(NOT DEFINED XMLCATALOG OR NOT DEFINED CATALOG OR
   NOT DEFINED TEST_OUTPUT_DIR)
    message(FATAL_ERROR "Missing xmlcatalog shell test arguments")
endif()

string(REPEAT "A" 470 long_argument)
set(test_inputs
    "${long_argument}"
    "public ${long_argument}"
)
set(many_arguments "public")
foreach(index RANGE 1 80)
    string(APPEND many_arguments " x")
endforeach()
list(APPEND test_inputs "${many_arguments}")

set(index 0)
foreach(test_input IN LISTS test_inputs)
    math(EXPR index "${index} + 1")
    set(input_file "${TEST_OUTPUT_DIR}/xmlcatalog-shell-overflow-${index}.txt")
    file(WRITE "${input_file}" "${test_input}\n")
    execute_process(
        COMMAND "${XMLCATALOG}" --shell "${CATALOG}"
        INPUT_FILE "${input_file}"
        RESULT_VARIABLE result
        OUTPUT_VARIABLE output
        ERROR_VARIABLE error
    )
    file(REMOVE "${input_file}")
    if(NOT result STREQUAL "0")
        message(FATAL_ERROR
            "xmlcatalog shell case ${index} failed (${result}): ${output}${error}")
    endif()
endforeach()
