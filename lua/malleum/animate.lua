local config = {
    fps = 50,
    name = 'slide',
}

config.update = function (grid)
    for i = 1, #grid do
        local last_char = grid[i][#(grid[i])]
        for j = 1, #(grid[i]) do
            grid[i][j], last_char = last_char, grid[i][j]
        end
    end
    return true
end

require("cellular-automaton").register_animation(config)

local config2 = {
    fps = 30,
    name = 'down',
}

config2.update = function (grid)
    local largest = 0
    local ind = 0
    for i = 1, #grid do
        local size = #grid[i]
        if size > largest then
            largest = size
            ind = i
        end
    end

    for j = 1, #grid[ind] do
        local bottom_char = grid[#grid][j]
        for i = 1, #grid do
            grid[i][j], bottom_char = bottom_char, grid[i][j]
        end
    end
    return true
end

require("cellular-automaton").register_animation(config2)


local config3 = {
    fps = 30,
    name = 'die',
}

config3.update = function (grid)
    for i = 1, #grid do
        local last_char = grid[i][#(grid[i])]
        for j = #(grid[i]), 1, -1 do
            grid[i][j], last_char = last_char, grid[i][j]
        end
    end
    return true
end

require("cellular-automaton").register_animation(config3)
