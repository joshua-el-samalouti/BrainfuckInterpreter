# Brainfuck Interpreter

function brainfuck_interpreter(path, output_mode)
    # output_mode "ascii" or "numeric"
    open(path, "r") do file
        script = read(file, String)

        a = Dict(
            1 => 0
        )
        p = 1
        i = 1
        while i <= length(script)
            if script[i] == '+'
                if a[p] == 255
                    a[p] = 0
                else
                    a[p] = a[p] + 1
                end
            elseif script[i] == '-'
                if a[p] == 0
                    a[p] = 255
                else
                    a[p] = a[p] - 1
                end
            elseif script[i] == '>'
                p += 1
                if !haskey(a,p)
                    a[p] = 0
                end
            elseif script[i] == '<'
                p -= 1
                if !haskey(a,p)
                    a[p] = 0
                end
            elseif script[i] == '['
                if a[p] == 0
                    depth = 1
                    while depth > 0
                        i += 1
                        if script[i] == '['
                            depth += 1
                        elseif script[i] == ']'
                            depth -= 1
                        end
                    end
                end
            elseif script[i] == ']'
                if a[p] != 0
                    depth = 1
                    while depth > 0
                        i -= 1
                        if script[i] == '['
                            depth -= 1
                        elseif script[i] == ']'
                            depth += 1
                        end
                    end
                end
            elseif script[i] == '.'
                if output_mode == "ascii"
                    print(Char(a[p]))
                elseif output_mode == "numeric"
                    print(a[p])
                end
            end
            i += 1
        end
    end
end
