# NestedNameSpecifier
function getPrefix(x::NestedNameSpecifier)
    @check_ptrs x
    return NestedNameSpecifier(clang_NestedNameSpecifier_getPrefix(x))
end

function containsErrors(x::NestedNameSpecifier)
    @check_ptrs x
    return clang_NestedNameSpecifier_containsErrors(x)
end

function dump(x::NestedNameSpecifier)
    @check_ptrs x
    return clang_NestedNameSpecifier_dump(x)
end
