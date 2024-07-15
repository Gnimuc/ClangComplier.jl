"""
    abstract type AbstractFinder <: Any
Supertype for "lookup" functors.
"""
abstract type AbstractFinder end

"""
    struct DeclFinder <: AbstractFinder
Functor for decl lookup.
"""
struct DeclFinder <: AbstractFinder
    spec::CXXScopeSpec
    result::LookupResult
    kind::CXLookupNameKind
end
DeclFinder(r::LookupResult, k::CXLookupNameKind) = DeclFinder(CXXScopeSpec(), r, k)

function dispose(x::DeclFinder)
    dispose(x.spec)
    dispose(x.result)
end

function DeclFinder(i::CxxInterpreter, kind::CXLookupNameKind=CXLookupNameKind_LookupOrdinaryName)
    ci, sema = get_instance(i), get_sema(i)
    loc = get_main_file_begin_loc(getSourceManager(ci))  # used as a fake loc
    result = LookupResult(sema, DeclarationName(), loc, kind)
    return DeclFinder(result, kind)
end

function reset(x::DeclFinder)
    clear(x.result, x.kind)
    clear(x.spec)
end

function get_decl(x::DeclFinder)
    isempty(x.result) && error("no lookup result.")
    return getRepresentativeDecl(x.result)
end

strip_nns(nns::AbstractString, code::AbstractString) = code[length(nns)+1:end]

function diagnose_declname(code::AbstractString, type_name::AbstractString, nns::AbstractString="")
    s = strip_nns(nns, code)
    if isempty(type_name) # template-ids are not handled in `parse_cxx_scope_spec`
        # assume this is a template-id (e.g. `vector<int>`)
        # do the lookup for `vector`
        idx = findfirst('<', s)
        s = isnothing(idx) ? s : s[1:idx-1]
    elseif s != type_name
        # this happends when the template-id is not annotated in `parse_cxx_scope_spec` due to missing headers
        @assert occursin(type_name, s)
        idx = findfirst('>', s)
        id = isnothing(idx) ? s : s[1:idx]
        error("failed to annotate the template-id `$id`. Please include the missing headers.")
    elseif isempty(s)
        error("the input is a scope specifier `$nns` without a decl name.")
    end
    return s
end

function (x::DeclFinder)(i::CxxInterpreter, code::String)
    reset(x)
    sema, parser = get_sema(i), get_parser(i)
    type_name = parse_cxx_scope_spec(i, x.spec, code)
    if isValid(x.spec)
        nns = getName(getScopeRep(x.spec))
        declname = diagnose_declname(code, type_name, nns)
        setLookupName(x.result, DeclarationName(get_name(get_ast_context(i), declname)))
        is_found = LookupParsedName(sema, x.result, getCurScope(parser), x.spec, true, true)
        !is_found && error("failed to lookup `$code`.")
    else
        setLookupName(x.result, DeclarationName(get_name(get_ast_context(i), code)))
        is_found = LookupName(sema, x.result, getCurScope(parser), true)
        !is_found && error("failed to lookup `$code`.")
    end
    return !isempty(x.result)
end
