lines = []

open("2024inputday3.txt", "r") do file
    for line in eachline(file)
        push!(lines, line)
    end
end

pattern = r"mul\(\d{1,3},\d{1,3}\)"
parenthesis = r"\(([^)]+)\)"

function find_sum()::Int
    total = 0
    for line in lines
        for m in eachmatch(pattern, line)
            match_result = match(parenthesis, m.match)
            captures = split(match_result.captures[1], ",")
            num1 = parse(Int, captures[1])
            num2 = parse(Int, captures[2])
            total += num1 * num2
        end
    end
    return total
end

total = find_sum()
println(total)