using DelimitedFiles
using DataFrames

data = readdlm("2024inputday1.txt", ' ')
df = DataFrame(data, :auto)

function calculate_total(list1, list2)
    total = 0
    for i in eachindex(list1)
        total += abs(list1[i] - list2[i])
    end
    return total
end

list1, list2 = sort(df.x1), sort(df.x4)
total = calculate_total(list1, list2)
println(total)