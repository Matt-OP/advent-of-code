using DelimitedFiles
using DataFrames

data = readdlm("2024inputday1.txt", ' ')
df = DataFrame(data, :auto)

function calculate_similarity_score(col1, col2)
    score = 0
    for i in eachindex(col1)
        cnt = 0
        for j in eachindex(col2)
            if col1[i] == col2[j]
                cnt += 1
            end
        end
        score += col1[i] * cnt
    end
    return score
end

score = calculate_similarity_score(df.x1, df.x4)
println(score)