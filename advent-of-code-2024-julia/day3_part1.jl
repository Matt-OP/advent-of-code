using DelimitedFiles
using DataFrames

lines = []

open("C:2024inputday3.txt", "r") do file
    for line in eachline(file)
        push!(lines, line)
    end
end

pattern = r"mul\(\d{1,3},\d{1,3}\)"

function find_sum()
    total = 0
    for line in lines
        for m in eachmatch(pattern, line)
            println(m.match)
            total += 1
        end
    end
    return total
end
