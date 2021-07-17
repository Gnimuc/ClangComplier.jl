function parse_ast(sema::Sema, PrintStats::Bool=false, SkipFunctionBodies::Bool=false)
    @assert sema.ptr != C_NULL "Sema has a NULL pointer."
    clang_ParseAST(sema.ptr, PrintStats, SkipFunctionBodies)
    return nothing
end

function parse(instance::CompilerInstance)
    diag_printer = TextDiagnosticPrinter(get_diagnostic_client(instance).ptr)

    preprocessor = get_preprocessor(instance)
    initialize_builtins(preprocessor)

    begin_source_file(diag_printer, get_lang_options(instance), preprocessor)

    parse_ast(get_sema(instance))

    end_source_file(diag_printer)

    return true
end

function parse(instance::CompilerInstance, codegen::CodeGenerator, parser::Parser)
    diag_printer = TextDiagnosticPrinter(get_diagnostic_client(instance).ptr)

    preprocessor = get_preprocessor(instance)
    enter_main_file(preprocessor)
    initialize_builtins(preprocessor)

    begin_source_file(diag_printer, get_lang_options(instance), preprocessor)

    initialize(parser)

    sema = get_sema(instance)
    ast_ctx = get_ast_context(instance)

    if try_parse_and_skip_invalid_or_parsed_decl(parser, codegen)
        process_weak_toplevel_decls(sema, codegen)
        handle_translation_unit(codegen, ast_ctx)
        end_source_file(diag_printer)
        return true
    else
        end_source_file(diag_printer)
        return false
    end
end


function try_parse_and_skip_invalid_or_parsed_decl(p::Parser, cg::CodeGenerator)
    @assert p.ptr != C_NULL "Parser has a NULL pointer."
    @assert cg.ptr != C_NULL "CodeGenerator has a NULL pointer."
    return clang_Parser_tryParseAndSkipInvalidOrParsedDecl(p.ptr, cg.ptr)
end

function process_weak_toplevel_decls(sema::Sema, cg::CodeGenerator)
    @assert sema.ptr != C_NULL "Sema has a NULL pointer."
    @assert cg.ptr != C_NULL "CodeGenerator has a NULL pointer."
    clang_Sema_processWeakTopLevelDecls(sema.ptr, cg.ptr)
    return nothing
end
