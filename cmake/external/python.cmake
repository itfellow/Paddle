# Copyright (c) 2016 PaddlePaddle Authors. All Rights Reserve.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

INCLUDE(ExternalProject)
INCLUDE(python_module)

FIND_PACKAGE(PythonInterp 2.7)
IF(WITH_PYTHON)
    FIND_PACKAGE(PythonLibs 2.7)
ENDIF(WITH_PYTHON)

SET(py_env "")
SET(USE_VIRTUALENV_FOR_TEST 1)
IF(PYTHONINTERP_FOUND)
    find_python_module(pip REQUIRED)
    find_python_module(numpy REQUIRED)
    find_python_module(wheel REQUIRED)
    find_python_module(google.protobuf REQUIRED)
    FIND_PACKAGE(NumPy REQUIRED)
    IF(${PY_GOOGLE.PROTOBUF_VERSION} AND ${PY_GOOGLE.PROTOBUF_VERSION} VERSION_LESS "3.0.0")
        MESSAGE(FATAL_ERROR "Found Python Protobuf ${PY_GOOGLE.PROTOBUF_VERSION} < 3.0.0, "
        "please use pip to upgrade protobuf. pip install -U protobuf")
    ENDIF()
ENDIF(PYTHONINTERP_FOUND)

IF(WITH_PYTHON)
    INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_DIR})
    INCLUDE_DIRECTORIES(${PYTHON_NUMPY_INCLUDE_DIR})
ELSE()
    SET(PYTHON_LIBRARIES "")
ENDIF()
