module LibClangEx

using ..ClangCompiler: libclangex

const time_t = Clong


mutable struct CXTranslationUnitImpl end

const CXTranslationUnit = Ptr{CXTranslationUnitImpl}

mutable struct LLVMOpaqueContext end

const LLVMContextRef = Ptr{LLVMOpaqueContext}

mutable struct LLVMOpaqueModule end

const LLVMModuleRef = Ptr{LLVMOpaqueModule}

const CXIntrusiveRefCntPtr = Ptr{Cvoid}

const CXMemoryBuffer = Ptr{Cvoid}

const CXTargetOptions = Ptr{Cvoid}

const CXCodeGenOptions = Ptr{Cvoid}

const CXHeaderSearchOptions = Ptr{Cvoid}

const CXPreprocessorOptions = Ptr{Cvoid}

const CXSema = Ptr{Cvoid}

const CXPreprocessor = Ptr{Cvoid}

const CXASTUnit = Ptr{Cvoid}

const CXASTContext = Ptr{Cvoid}

const CXASTConsumer = Ptr{Cvoid}

const CXCompilerInstance = Ptr{Cvoid}

const CXCompilerInvocation = Ptr{Cvoid}

const CXDirectoryEntry = Ptr{Cvoid}

const CXFileEntry = Ptr{Cvoid}

const CXFileEntryRef = Ptr{Cvoid}

const CXFileManager = Ptr{Cvoid}

const CXSourceManager = Ptr{Cvoid}

const CXDiagnosticIDs = Ptr{Cvoid}

const CXDiagnosticOptions = Ptr{Cvoid}

const CXDiagnosticConsumer = Ptr{Cvoid}

const CXIgnoringDiagConsumer = Ptr{Cvoid}

const CXDiagnosticsEngine = Ptr{Cvoid}

const CXCodeGenerator = Ptr{Cvoid}

function clang_Driver_GetResourcesPathLength(BinaryPath)
    ccall((:clang_Driver_GetResourcesPathLength, libclangex), Csize_t, (Ptr{Cchar},), BinaryPath)
end

function clang_Driver_GetResourcesPath(BinaryPath, ResourcesPath, N)
    ccall((:clang_Driver_GetResourcesPath, libclangex), Cvoid, (Ptr{Cchar}, Ptr{Cchar}, Csize_t), BinaryPath, ResourcesPath, N)
end

function clang_TranslationUnit_getASTUnit(TU)
    ccall((:clang_TranslationUnit_getASTUnit, libclangex), CXASTUnit, (CXTranslationUnit,), TU)
end

function clang_ASTUnit_getASTContext(ASTU)
    ccall((:clang_ASTUnit_getASTContext, libclangex), CXASTContext, (CXASTUnit,), ASTU)
end

function clang_ASTUnit_getHeaderSearchOpts(ASTU)
    ccall((:clang_ASTUnit_getHeaderSearchOpts, libclangex), CXHeaderSearchOptions, (CXASTUnit,), ASTU)
end

function clang_ASTUnit_getPreprocessorOpts(ASTU)
    ccall((:clang_ASTUnit_getPreprocessorOpts, libclangex), CXPreprocessorOptions, (CXASTUnit,), ASTU)
end

function clang_ASTUnit_getDiagnostics(ASTU)
    ccall((:clang_ASTUnit_getDiagnostics, libclangex), CXDiagnosticsEngine, (CXASTUnit,), ASTU)
end

function clang_ASTUnit_getSema(ASTU)
    ccall((:clang_ASTUnit_getSema, libclangex), CXSema, (CXASTUnit,), ASTU)
end

function clang_ASTUnit_getFileManager(ASTU)
    ccall((:clang_ASTUnit_getFileManager, libclangex), CXFileManager, (CXASTUnit,), ASTU)
end

function clang_ASTUnit_getSourceManager(ASTU)
    ccall((:clang_ASTUnit_getSourceManager, libclangex), CXSourceManager, (CXASTUnit,), ASTU)
end

function clang_ASTUnit_getPreprocessor(ASTU)
    ccall((:clang_ASTUnit_getPreprocessor, libclangex), CXPreprocessor, (CXASTUnit,), ASTU)
end

@enum CXInit_Error::UInt32 begin
    CXInit_NoError = 0
    CXInit_CanNotCreate = 1
end

function clang_CreateLLVMCodeGen(CI, LLVMCtx, ModuleName)
    ccall((:clang_CreateLLVMCodeGen, libclangex), CXCodeGenerator, (CXCompilerInstance, LLVMContextRef, Ptr{Cchar}), CI, LLVMCtx, ModuleName)
end

function clang_CodeGenerator_getLLVMModule(CG)
    ccall((:clang_CodeGenerator_getLLVMModule, libclangex), LLVMModuleRef, (CXCodeGenerator,), CG)
end

function clang_CodeGenOptions_create(ErrorCode)
    ccall((:clang_CodeGenOptions_create, libclangex), CXCodeGenOptions, (Ptr{CXInit_Error},), ErrorCode)
end

function clang_CodeGenOptions_dispose(DO)
    ccall((:clang_CodeGenOptions_dispose, libclangex), Cvoid, (CXCodeGenOptions,), DO)
end

function clang_CompilerInstance_create(ErrorCode)
    ccall((:clang_CompilerInstance_create, libclangex), CXCompilerInstance, (Ptr{CXInit_Error},), ErrorCode)
end

function clang_CompilerInstance_dispose(CI)
    ccall((:clang_CompilerInstance_dispose, libclangex), Cvoid, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_hasDiagnostics(CI)
    ccall((:clang_CompilerInstance_hasDiagnostics, libclangex), Bool, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_getDiagnostics(CI)
    ccall((:clang_CompilerInstance_getDiagnostics, libclangex), CXDiagnosticsEngine, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_setDiagnostics(CI, Value)
    ccall((:clang_CompilerInstance_setDiagnostics, libclangex), Cvoid, (CXCompilerInstance, CXDiagnosticsEngine), CI, Value)
end

function clang_CompilerInstance_getDiagnosticClient(CI)
    ccall((:clang_CompilerInstance_getDiagnosticClient, libclangex), CXDiagnosticConsumer, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_createDiagnostics(CI, DC, ShouldOwnClient)
    ccall((:clang_CompilerInstance_createDiagnostics, libclangex), Cvoid, (CXCompilerInstance, CXDiagnosticConsumer, Bool), CI, DC, ShouldOwnClient)
end

function clang_CompilerInstance_createDiagnosticsEngine(DO, DC, ShouldOwnClient, CGO)
    ccall((:clang_CompilerInstance_createDiagnosticsEngine, libclangex), CXIntrusiveRefCntPtr, (CXDiagnosticOptions, CXDiagnosticConsumer, Bool, CXCodeGenOptions), DO, DC, ShouldOwnClient, CGO)
end

function clang_CompilerInstance_hasFileManager(CI)
    ccall((:clang_CompilerInstance_hasFileManager, libclangex), Bool, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_getFileManager(CI)
    ccall((:clang_CompilerInstance_getFileManager, libclangex), CXFileManager, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_setFileManager(CI, FM)
    ccall((:clang_CompilerInstance_setFileManager, libclangex), Cvoid, (CXCompilerInstance, CXFileManager), CI, FM)
end

function clang_CompilerInstance_createFileManager(CI)
    ccall((:clang_CompilerInstance_createFileManager, libclangex), CXFileManager, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_createFileManagerWithVOFS4PCH(CI, Path, ModificationTime, PCHBuffer)
    ccall((:clang_CompilerInstance_createFileManagerWithVOFS4PCH, libclangex), CXFileManager, (CXCompilerInstance, Ptr{Cchar}, time_t, CXMemoryBuffer), CI, Path, ModificationTime, PCHBuffer)
end

function clang_CompilerInstance_hasSourceManager(CI)
    ccall((:clang_CompilerInstance_hasSourceManager, libclangex), Bool, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_getSourceManager(CI)
    ccall((:clang_CompilerInstance_getSourceManager, libclangex), CXSourceManager, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_setSourceManager(CI, SM)
    ccall((:clang_CompilerInstance_setSourceManager, libclangex), Cvoid, (CXCompilerInstance, CXSourceManager), CI, SM)
end

function clang_CompilerInstance_createSourceManager(CI, FileMgr)
    ccall((:clang_CompilerInstance_createSourceManager, libclangex), Cvoid, (CXCompilerInstance, CXFileManager), CI, FileMgr)
end

function clang_CompilerInstance_hasInvocation(CI)
    ccall((:clang_CompilerInstance_hasInvocation, libclangex), Bool, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_setInvocation(CI, CInv)
    ccall((:clang_CompilerInstance_setInvocation, libclangex), Cvoid, (CXCompilerInstance, CXCompilerInvocation), CI, CInv)
end

function clang_CompilerInstance_getInvocation(CI)
    ccall((:clang_CompilerInstance_getInvocation, libclangex), CXCompilerInvocation, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_setTarget(CI)
    ccall((:clang_CompilerInstance_setTarget, libclangex), Cvoid, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_createSema(CI)
    ccall((:clang_CompilerInstance_createSema, libclangex), Cvoid, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_getSema(CI)
    ccall((:clang_CompilerInstance_getSema, libclangex), CXSema, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_setSema(CI, S)
    ccall((:clang_CompilerInstance_setSema, libclangex), Cvoid, (CXCompilerInstance, CXSema), CI, S)
end

function clang_CompilerInstance_createPreprocessor(CI)
    ccall((:clang_CompilerInstance_createPreprocessor, libclangex), Cvoid, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_setPreprocessor(CI, PP)
    ccall((:clang_CompilerInstance_setPreprocessor, libclangex), Cvoid, (CXCompilerInstance, CXPreprocessor), CI, PP)
end

function clang_CompilerInstance_createASTContext(CI)
    ccall((:clang_CompilerInstance_createASTContext, libclangex), Cvoid, (CXCompilerInstance,), CI)
end

function clang_CompilerInstance_setASTContext(CI, Ctx)
    ccall((:clang_CompilerInstance_setASTContext, libclangex), Cvoid, (CXCompilerInstance, CXASTContext), CI, Ctx)
end

function clang_CompilerInstance_setCodeGenerator(CI, CG)
    ccall((:clang_CompilerInstance_setCodeGenerator, libclangex), Cvoid, (CXCompilerInstance, CXCodeGenerator), CI, CG)
end

function clang_CompilerInvocation_create(ErrorCode)
    ccall((:clang_CompilerInvocation_create, libclangex), CXCompilerInvocation, (Ptr{CXInit_Error},), ErrorCode)
end

function clang_CompilerInvocation_dispose(CI)
    ccall((:clang_CompilerInvocation_dispose, libclangex), Cvoid, (CXCompilerInvocation,), CI)
end

function clang_CompilerInvocation_createFromCommandLine(command_line_args_with_src, num_command_line_args, Diags, ErrorCode)
    ccall((:clang_CompilerInvocation_createFromCommandLine, libclangex), CXCompilerInvocation, (Ptr{Ptr{Cchar}}, Cint, CXDiagnosticsEngine, Ptr{CXInit_Error}), command_line_args_with_src, num_command_line_args, Diags, ErrorCode)
end

function clang_CompilerInvocation_getTargetOpts(CI)
    ccall((:clang_CompilerInvocation_getTargetOpts, libclangex), CXTargetOptions, (CXCompilerInvocation,), CI)
end

function clang_CompilerInvocation_getCodeGenOpts(CI)
    ccall((:clang_CompilerInvocation_getCodeGenOpts, libclangex), CXCodeGenOptions, (CXCompilerInvocation,), CI)
end

function clang_CompilerInvocation_getPreprocessorOpts(CI)
    ccall((:clang_CompilerInvocation_getPreprocessorOpts, libclangex), CXPreprocessorOptions, (CXCompilerInvocation,), CI)
end

function clang_CompilerInvocation_getHeaderSearchOpts(CI)
    ccall((:clang_CompilerInvocation_getHeaderSearchOpts, libclangex), CXHeaderSearchOptions, (CXCompilerInvocation,), CI)
end

function clang_DiagnosticIDs_create(ErrorCode)
    ccall((:clang_DiagnosticIDs_create, libclangex), CXDiagnosticIDs, (Ptr{CXInit_Error},), ErrorCode)
end

function clang_DiagnosticIDs_dispose(ID)
    ccall((:clang_DiagnosticIDs_dispose, libclangex), Cvoid, (CXDiagnosticIDs,), ID)
end

function clang_DiagnosticOptions_create(ErrorCode)
    ccall((:clang_DiagnosticOptions_create, libclangex), CXDiagnosticOptions, (Ptr{CXInit_Error},), ErrorCode)
end

function clang_DiagnosticOptions_dispose(DO)
    ccall((:clang_DiagnosticOptions_dispose, libclangex), Cvoid, (CXDiagnosticOptions,), DO)
end

function clang_DiagnosticConsumer_create(ErrorCode)
    ccall((:clang_DiagnosticConsumer_create, libclangex), CXDiagnosticConsumer, (Ptr{CXInit_Error},), ErrorCode)
end

function clang_DiagnosticConsumer_dispose(DC)
    ccall((:clang_DiagnosticConsumer_dispose, libclangex), Cvoid, (CXDiagnosticConsumer,), DC)
end

function clang_IgnoringDiagConsumer_create(ErrorCode)
    ccall((:clang_IgnoringDiagConsumer_create, libclangex), CXIgnoringDiagConsumer, (Ptr{CXInit_Error},), ErrorCode)
end

function clang_IgnoringDiagConsumer_dispose(DC)
    ccall((:clang_IgnoringDiagConsumer_dispose, libclangex), Cvoid, (CXIgnoringDiagConsumer,), DC)
end

function clang_DiagnosticsEngine_create(ID, DO, DC, ShouldOwnClient, ErrorCode)
    ccall((:clang_DiagnosticsEngine_create, libclangex), CXDiagnosticsEngine, (CXDiagnosticIDs, CXDiagnosticOptions, CXDiagnosticConsumer, Bool, Ptr{CXInit_Error}), ID, DO, DC, ShouldOwnClient, ErrorCode)
end

function clang_DiagnosticsEngine_dispose(DE)
    ccall((:clang_DiagnosticsEngine_dispose, libclangex), Cvoid, (CXDiagnosticsEngine,), DE)
end

function clang_FileManager_create(ErrorCode)
    ccall((:clang_FileManager_create, libclangex), CXFileManager, (Ptr{CXInit_Error},), ErrorCode)
end

function clang_FileManager_dispose(FM)
    ccall((:clang_FileManager_dispose, libclangex), Cvoid, (CXFileManager,), FM)
end

function clang_FileManager_getBufferForFile(FM, FE, isVolatile, RequiresNullTerminator)
    ccall((:clang_FileManager_getBufferForFile, libclangex), CXMemoryBuffer, (CXFileManager, CXFileEntry, Bool, Bool), FM, FE, isVolatile, RequiresNullTerminator)
end

function clang_FileManager_PrintStats(FM)
    ccall((:clang_FileManager_PrintStats, libclangex), Cvoid, (CXFileManager,), FM)
end

function clang_FileManager_getDirectory(FM, DirName, CacheFailure)
    ccall((:clang_FileManager_getDirectory, libclangex), CXDirectoryEntry, (CXFileManager, Ptr{Cchar}, Bool), FM, DirName, CacheFailure)
end

function clang_DirectoryEntry_getName(DE)
    ccall((:clang_DirectoryEntry_getName, libclangex), Ptr{Cchar}, (CXDirectoryEntry,), DE)
end

function clang_FileManager_getFileRef(FM, Filename, OpenFile, CacheFailure)
    ccall((:clang_FileManager_getFileRef, libclangex), CXFileEntryRef, (CXFileManager, Ptr{Cchar}, Bool, Bool), FM, Filename, OpenFile, CacheFailure)
end

function clang_FileEntryRef_dispose(FER)
    ccall((:clang_FileEntryRef_dispose, libclangex), Cvoid, (CXFileEntryRef,), FER)
end

function clang_FileEntryRef_getFileEntry(FER)
    ccall((:clang_FileEntryRef_getFileEntry, libclangex), CXFileEntry, (CXFileEntryRef,), FER)
end

function clang_FileManager_getVirtualFile(FM, Filename, Size, ModificationTime)
    ccall((:clang_FileManager_getVirtualFile, libclangex), CXFileEntry, (CXFileManager, Ptr{Cchar}, Cuint, time_t), FM, Filename, Size, ModificationTime)
end

function clang_FileEntry_getName(FE)
    ccall((:clang_FileEntry_getName, libclangex), Ptr{Cchar}, (CXFileEntry,), FE)
end

function clang_FileEntry_tryGetRealPathName(FE)
    ccall((:clang_FileEntry_tryGetRealPathName, libclangex), Ptr{Cchar}, (CXFileEntry,), FE)
end

function clang_FileEntry_isValid(FE)
    ccall((:clang_FileEntry_isValid, libclangex), Bool, (CXFileEntry,), FE)
end

function clang_FileEntry_getUID(FE)
    ccall((:clang_FileEntry_getUID, libclangex), Cuint, (CXFileEntry,), FE)
end

function clang_FileEntry_getModificationTime(FE)
    ccall((:clang_FileEntry_getModificationTime, libclangex), time_t, (CXFileEntry,), FE)
end

function clang_FileEntry_getDir(FE)
    ccall((:clang_FileEntry_getDir, libclangex), CXDirectoryEntry, (CXFileEntry,), FE)
end

function clang_FileEntry_isNamedPipe(FE)
    ccall((:clang_FileEntry_isNamedPipe, libclangex), Bool, (CXFileEntry,), FE)
end

function clang_MemoryBuffer_getMemBuffer(InputData, InputDataSize, BufferName, BufferNameSize, RequiresNullTerminator)
    ccall((:clang_MemoryBuffer_getMemBuffer, libclangex), CXMemoryBuffer, (Ptr{Cchar}, Cuint, Ptr{Cchar}, Cuint, Bool), InputData, InputDataSize, BufferName, BufferNameSize, RequiresNullTerminator)
end

function clang_MemoryBuffer_getMemBufferCopy(InputData, InputDataSize, BufferName, BufferNameSize)
    ccall((:clang_MemoryBuffer_getMemBufferCopy, libclangex), CXMemoryBuffer, (Ptr{Cchar}, Cuint, Ptr{Cchar}, Cuint), InputData, InputDataSize, BufferName, BufferNameSize)
end

function clang_CodeGenOptions_getArgv0(CGO)
    ccall((:clang_CodeGenOptions_getArgv0, libclangex), Ptr{Cchar}, (CXCodeGenOptions,), CGO)
end

function clang_CodeGenOptions_getCommandLineArgsNum(CGO)
    ccall((:clang_CodeGenOptions_getCommandLineArgsNum, libclangex), Csize_t, (CXCodeGenOptions,), CGO)
end

function clang_CodeGenOptions_getCommandLineArgs(CGO, ArgsOut, Num)
    ccall((:clang_CodeGenOptions_getCommandLineArgs, libclangex), Cvoid, (CXCodeGenOptions, Ptr{Ptr{Cchar}}, Csize_t), CGO, ArgsOut, Num)
end

function clang_HeaderSearchOptions_GetResourceDirLength(HSO)
    ccall((:clang_HeaderSearchOptions_GetResourceDirLength, libclangex), Csize_t, (CXHeaderSearchOptions,), HSO)
end

function clang_HeaderSearchOptions_GetResourceDir(HSO, ResourcesDir, N)
    ccall((:clang_HeaderSearchOptions_GetResourceDir, libclangex), Cvoid, (CXHeaderSearchOptions, Ptr{Cchar}, Csize_t), HSO, ResourcesDir, N)
end

function clang_HeaderSearchOptions_SetResourceDir(HSO, ResourcesDir, N)
    ccall((:clang_HeaderSearchOptions_SetResourceDir, libclangex), Cvoid, (CXHeaderSearchOptions, Ptr{Cchar}, Csize_t), HSO, ResourcesDir, N)
end

function clang_PreprocessorOptions_getChainedIncludesNum(PPO)
    ccall((:clang_PreprocessorOptions_getChainedIncludesNum, libclangex), Csize_t, (CXPreprocessorOptions,), PPO)
end

function clang_PreprocessorOptions_getChainedIncludes(PPO, IncsOut, Num)
    ccall((:clang_PreprocessorOptions_getChainedIncludes, libclangex), Cvoid, (CXPreprocessorOptions, Ptr{Ptr{Cchar}}, Csize_t), PPO, IncsOut, Num)
end

function clang_PreprocessorOptions_getIncludesNum(PPO)
    ccall((:clang_PreprocessorOptions_getIncludesNum, libclangex), Csize_t, (CXPreprocessorOptions,), PPO)
end

function clang_PreprocessorOptions_getIncludes(PPO, IncsOut, Num)
    ccall((:clang_PreprocessorOptions_getIncludes, libclangex), Cvoid, (CXPreprocessorOptions, Ptr{Ptr{Cchar}}, Csize_t), PPO, IncsOut, Num)
end

function clang_PreprocessorOptions_getMacroIncludesNum(PPO)
    ccall((:clang_PreprocessorOptions_getMacroIncludesNum, libclangex), Csize_t, (CXPreprocessorOptions,), PPO)
end

function clang_PreprocessorOptions_getMacroIncludes(PPO, IncsOut, Num)
    ccall((:clang_PreprocessorOptions_getMacroIncludes, libclangex), Cvoid, (CXPreprocessorOptions, Ptr{Ptr{Cchar}}, Csize_t), PPO, IncsOut, Num)
end

function clang_SourceManager_create(Diag, FileMgr, UserFilesAreVolatile, ErrorCode)
    ccall((:clang_SourceManager_create, libclangex), CXSourceManager, (CXDiagnosticsEngine, CXFileManager, Bool, Ptr{CXInit_Error}), Diag, FileMgr, UserFilesAreVolatile, ErrorCode)
end

function clang_SourceManager_dispose(SM)
    ccall((:clang_SourceManager_dispose, libclangex), Cvoid, (CXSourceManager,), SM)
end

function clang_SourceManager_overrideFileContents(SM, FE, MB)
    ccall((:clang_SourceManager_overrideFileContents, libclangex), Cvoid, (CXSourceManager, CXFileEntry, CXMemoryBuffer), SM, FE, MB)
end

function clang_SourceManager_createAndSetMainFileID(SM, FE)
    ccall((:clang_SourceManager_createAndSetMainFileID, libclangex), Cvoid, (CXSourceManager, CXFileEntry), SM, FE)
end

function clang_SourceManager_getMainFileID_HashValue(SM)
    ccall((:clang_SourceManager_getMainFileID_HashValue, libclangex), Cint, (CXSourceManager,), SM)
end

function clang_ParseAST(Sema, PrintStats, SkipFunctionBodies)
    ccall((:clang_ParseAST, libclangex), Cvoid, (CXSema, Bool, Bool), Sema, PrintStats, SkipFunctionBodies)
end

# exports
const PREFIXES = ["clang", "CX"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module