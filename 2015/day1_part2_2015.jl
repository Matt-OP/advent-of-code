lines = []

open("2015inputday1.txt", "r") do file
    for line in eachline(file)
        push!(lines, line)
    end
end

function enter_basement()
    total = 0
    for (idx, char) in enumerate(lines[1])
        if char == '('
            total += 1
        else
            total -= 1
        end
        if total == -1
            return idx
        end
    end
end

position = enter_basement()
println(position)