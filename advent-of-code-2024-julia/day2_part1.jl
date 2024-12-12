using DelimitedFiles
using DataFrames

data = readdlm("2024inputday2.txt", ' ')
df = DataFrame(data, :auto)

function calculate_total(df::DataFrame)::Int
    total = 0
    for i in 1:nrow(df)
        row = collect(df[i, :])
        row_elements = collect(i for i in row if i != "")
        increasing = false
        if row_elements[1] < row_elements[2]
            increasing = true
        end
        count = 0
        for j in 2:length(row_elements)
            if row_elements[j] > row_elements[j - 1] && increasing && (row_elements[j] - row_elements[j - 1]) in 1:3
                count += 1
            elseif row_elements[j] < row_elements[j - 1] && !increasing && abs(row_elements[j] - row_elements[j - 1]) in 1:3
                count += 1
            else
                break
            end
            if length(row_elements) - 1 == count
                total += 1
            end
        end
    end
    return total
end

total = calculate_total(df)
println(total)