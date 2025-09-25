function EnsureResourceName(expected)
    local resourceName = GetCurrentResourceName()
    if resourceName ~= expected then
        print(("[ERROR] Resource name mismatch! Expected: %s, Found: %s"):format(expected, resourceName))
        if IsDuplicityVersion() then StopResource(resourceName) end
        return false
    end

    return true
end
