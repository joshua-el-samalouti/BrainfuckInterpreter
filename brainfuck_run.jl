include("brainfuck_interpreter.jl")
dir = @__DIR__
brainfuck_interpreter(dir * "/brainfuck_testscript.bf", "ascii")