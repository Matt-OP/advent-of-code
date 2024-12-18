lines = []

open("2015inputday1.txt", "r") do file
    for line in eachline(file)
        push!(lines, line)
    end
end

total = 0

for char in lines[1]
    if char == '('
        global total += 1
    else
        global total -= 1
    end
end

println(total)