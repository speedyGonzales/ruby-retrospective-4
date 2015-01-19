def fibonacci(number)
    if [1,2].include?(number)
        return 1
    else
        return fibonacci(number - 1) + fibonacci(number - 2)
    end
end

def lucas(number)
    case number
    when 1 then return 2
    when 2 then return 1
    else
        return lucas(number - 1) + lucas(number - 2)
    end
end

def series(name, number)
    case name
    when 'fibonacci' then return fibonacci(number)
    when 'lucas' then return lucas(number)
    when 'summed' then fibonacci(number) + lucas(number)
    end
end
