lines = []

open("2015inputday2.txt", "r") do file
    for line in eachline(file)
        push!(lines, line)
    end
end

function calculate_size(l, w, h)
    lw, wh, hl = l * w, w * h, h * l
    size = 2 * lw + 2 * wh + 2 * hl + minimum([lw, wh, hl])
    return size
end

total = 0

for dim in lines
    l, w, h = [parse(Int, x) for x in split(dim, 'x')]
    size = calculate_size(l, w, h)
    global total += size
end

println(total)