local ascii_mode_clear = {}

function ascii_mode_clear.init(env)
    local context = env.engine.context
    if context.option_update_notifier then
        env.option_notifier = context.option_update_notifier:connect(function(ctx, name)
            if name == "ascii_mode" then
                ctx:clear()
            end
        end)
    end
end

function ascii_mode_clear.fini(env)
    if env.option_notifier then
        env.option_notifier:disconnect()
        env.option_notifier = nil
    end
end

function ascii_mode_clear.func(key, env)
    return 2
end

return ascii_mode_clear
