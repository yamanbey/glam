import sys
import os
env = Environment(CXX = 'g++',
                  CCFLAGS = '-O0',
		  CXXFLAGS = '-std=c++14 -Wall')

VariantDir('build', 'src')

exports = []
try:
    debug = ARGUMENTS['debug']
except:
    debug = 0
exports.append(env)
SConscript(['build/SConscript'], exports=['env', 'debug'])
