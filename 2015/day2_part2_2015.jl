lines = []

open("2015inputday2.txt", "r") do file
    for line in eachline(file)
        push!(lines, line)
    end
end

function calculate_size(l, w, h)
    if length(Set([l, w, h])) == 1
        return l * 4 + l * l * l
    else
        min1 = minimum([l, w, h])
        arr = [i for i in [l, w, h] if i != min1]
        if length(arr) == 1
            min2 = min1
        else
            min2 = minimum(arr)
        end
        size = min1 * 2 + min2 * 2
        lwh = l * w * h
        return size + lwh
    end
end

total = 0

for dim in lines
    l, w, h = [parse(Int, x) for x in split(dim, 'x')]
    size = calculate_size(l, w, h)
    global total += size
end

println(total)