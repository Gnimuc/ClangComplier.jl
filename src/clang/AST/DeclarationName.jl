"""
    struct DeclarationName <: Any
Represent a declaration name.

Note that, the underlying pointer is NOT a *pointer* to a `clang::DeclarationName` object.
Instead, it's the opaque pointer representation of the `clang::DeclarationName` itself.
"""
struct DeclarationName
    ptr::CXDeclarationName
end
DeclarationName() = DeclarationName(clang_DeclarationName_create())

function DeclarationName(x::IdentifierInfo)
    @assert x.ptr != C_NULL "IdentifierInfo has a NULL pointer."
    return DeclarationName(clang_DeclarationName_createFromIdentifierInfo(x.ptr))
end

dump(x::DeclarationName) = clang_DeclarationName_dump(x.ptr)
is_empty(x::DeclarationName) = clang_DeclarationName_isEmpty(x.ptr)

function get_string(x::DeclarationName)
    str = clang_DeclarationName_getAsString(x.ptr)
    s = unsafe_string(str)
    clang_DeclarationName_disposeString(str)
    return s
end
