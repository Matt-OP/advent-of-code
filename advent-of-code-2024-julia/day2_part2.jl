using DelimitedFiles
using DataFrames

data = readdlm("2024inputday2.txt", ' ')
df = DataFrame(data, :auto)

function calculate_total(df::DataFrame)
    safe_idxs = Int[]
    for i in 1:nrow(df)
        row = collect(df[i, :])
        row_elements = collect(x for x in row if x != "")
        for r in 1:length(row_elements)
            row_el = copy(row_elements)
            deleteat!(row_el, r)
            if length(row_el) < 2
                continue
            end
            increasing = row_el[1] < row_el[2]
            count = 0
            for j in 2:length(row_el)
                if row_el[j] > row_el[j - 1] && increasing && (row_el[j] - row_el[j - 1]) in 1:3
                    count += 1
                elseif row_el[j] < row_el[j - 1] && !increasing && abs(row_el[j] - row_el[j - 1]) in 1:3
                    count += 1
                else
                    break
                end
            end
            if length(row_el) - 1 == count
                push!(safe_idxs, i)
            end
        end
    end
    return length(Set(safe_idxs))
end

total = calculate_total(df)
println(total)
