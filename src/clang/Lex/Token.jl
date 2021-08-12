"""
    struct Token <: Any
Hold a pointer to a `clang::Token` object.
"""
struct Token
    ptr::CXToken_
end

get_location(x::Token) = SourceLocation(clang_Token_getLocation(x.ptr))
function get_annotation_end_location(x::Token)
    return SourceLocation(clang_Token_getAnnotationEndLoc(x.ptr))
end
function get_annotation_range(x::Token)
    return SourceRange(get_location(x), get_annotation_end_location(x))
end

is_eof(Tok) = clang_Token_isKind_eof(Tok.ptr)
is_identifier(Tok) = clang_Token_isKind_identifier(Tok.ptr)
is_coloncolon(Tok) = clang_Token_isKind_coloncolon(Tok.ptr)

is_annot_cxxscope(Tok) = clang_Token_isKind_annot_cxxscope(Tok.ptr)
is_annot_typename(Tok) = clang_Token_isKind_annot_typename(Tok.ptr)
is_annot_template_id(Tok) = clang_Token_isKind_annot_template_id(Tok.ptr)

is_kw_enum(Tok) = clang_Token_isKind_kw_enum(Tok.ptr)
is_kw_typename(Tok) = clang_Token_isKind_kw_typename(Tok.ptr)

"""
    struct AnnotationValue <: Any
Hold a pointer to an "AnnotationValue".
"""
struct AnnotationValue
    ptr::CXAnnotationValue
end

function get_annotation_value(x::Token)
    return AnnotationValue(clang_Token_getAnnotationValue(x.ptr))
end
