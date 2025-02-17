#ifndef LLVM_CLANG_C_EXTRA_CXQUALTYPE_H
#define LLVM_CLANG_C_EXTRA_CXQUALTYPE_H

#include "clang-ex/CXTypes.h"
#include "clang-c/CXString.h"
#include "clang-c/ExternC.h"
#include "clang-c/Platform.h"

LLVM_CLANG_C_EXTERN_C_BEGIN

CXQualType clang_QualType_constructFromTypePtr(CXType_ Ptr, unsigned Quals);

CXType_ clang_QualType_getTypePtr(CXQualType OpaquePtr);

CXType_ clang_QualType_getTypePtrOrNull(CXQualType OpaquePtr);

bool clang_QualType_isCanonical(CXQualType OpaquePtr);

bool clang_QualType_isNull(CXQualType OpaquePtr);

bool clang_QualType_isConstQualified(CXQualType OpaquePtr);
bool clang_QualType_isRestrictQualified(CXQualType OpaquePtr);
bool clang_QualType_isVolatileQualified(CXQualType OpaquePtr);

bool clang_QualType_hasQualifiers(CXQualType OpaquePtr);

CXQualType clang_QualType_withConst(CXQualType OpaquePtr);
CXQualType clang_QualType_withVolatile(CXQualType OpaquePtr);
CXQualType clang_QualType_withRestrict(CXQualType OpaquePtr);

CXQualType clang_QualType_addConst(CXQualType OpaquePtr);
CXQualType clang_QualType_addVolatile(CXQualType OpaquePtr);
CXQualType clang_QualType_addRestrict(CXQualType OpaquePtr);

bool clang_QualType_isLocalConstQualified(CXQualType OpaquePtr);
bool clang_QualType_isLocalRestrictQualified(CXQualType OpaquePtr);
bool clang_QualType_isLocalVolatileQualified(CXQualType OpaquePtr);

bool clang_QualType_hasLocalQualifiers(CXQualType OpaquePtr);

unsigned clang_QualType_getCVRQualifiers(CXQualType OpaquePtr);

CXString clang_QualType_getAsString(CXQualType OpaquePtr);

void clang_QualType_dump(CXQualType OpaquePtr);

CXQualType clang_QualType_getCanonicalType(CXQualType OpaquePtr);

CXQualType clang_QualType_getLocalUnqualifiedType(CXQualType OpaquePtr);

CXQualType clang_QualType_getUnqualifiedType(CXQualType OpaquePtr);

// Type
bool clang_Type_isFromAST(CXType_ T);

// containsUnexpandedParameterPack

bool clang_Type_isCanonicalUnqualified(CXType_ T);

// getLocallyUnqualifiedSingleStepDesugaredType

bool clang_Type_isSizelessType(CXType_ T);

bool clang_Type_isSizelessBuiltinType(CXType_ T);

// isSVESizelessBuiltinType

// isRVVSizelessBuiltinType

// isWebAssemblyExternrefType

// isWebAssemblyTableType

// isVLSTBuiltinType

// getSveEltType

// isRVVVLSBuiltinType

// getRVVEltType

// isIncompleteType

// isIncompleteOrObjectType

// isObjectType

// isLiteralType

// isStructuralType

// isStandardLayoutType

bool clang_Type_isBuiltinType(CXType_ T);

// isSpecificBuiltinType

// isPlaceholderType

// getAsPlaceholderType

// isSpecificPlaceholderType

// isNonOverloadPlaceholderType

bool clang_Type_isIntegerType(CXType_ T);

bool clang_Type_isEnumeralType(CXType_ T);

bool clang_Type_isScopedEnumeralType(CXType_ T);

bool clang_Type_isBooleanType(CXType_ T);

bool clang_Type_isCharType(CXType_ T);

bool clang_Type_isWideCharType(CXType_ T);

bool clang_Type_isChar8Type(CXType_ T);

bool clang_Type_isChar16Type(CXType_ T);

bool clang_Type_isChar32Type(CXType_ T);

bool clang_Type_isAnyCharacterType(CXType_ T);

// isIntegralType

bool clang_Type_isIntegralOrEnumerationType(CXType_ T);

bool clang_Type_isIntegralOrUnscopedEnumerationType(CXType_ T);

bool clang_Type_isUnscopedEnumerationType(CXType_ T);

bool clang_Type_isRealFloatingType(CXType_ T);

bool clang_Type_isComplexType(CXType_ T);

bool clang_Type_isAnyComplexType(CXType_ T);

bool clang_Type_isFloatingType(CXType_ T);

bool clang_Type_isHalfType(CXType_ T);

bool clang_Type_isFloat16Type(CXType_ T);

bool clang_Type_isBFloat16Type(CXType_ T);

bool clang_Type_isFloat128Type(CXType_ T);

// isIbm128Type

bool clang_Type_isRealType(CXType_ T);

bool clang_Type_isArithmeticType(CXType_ T);

bool clang_Type_isVoidType(CXType_ T);

bool clang_Type_isScalarType(CXType_ T);

bool clang_Type_isAggregateType(CXType_ T);

bool clang_Type_isFundamentalType(CXType_ T);

bool clang_Type_isCompoundType(CXType_ T);

bool clang_Type_isFunctionType(CXType_ T);

bool clang_Type_isFunctionNoProtoType(CXType_ T);

bool clang_Type_isFunctionProtoType(CXType_ T);

bool clang_Type_isPointerType(CXType_ T);

bool clang_Type_isAnyPointerType(CXType_ T);

bool clang_Type_isBlockPointerType(CXType_ T);

bool clang_Type_isVoidPointerType(CXType_ T);

bool clang_Type_isReferenceType(CXType_ T);

bool clang_Type_isLValueReferenceType(CXType_ T);

bool clang_Type_isRValueReferenceType(CXType_ T);

bool clang_Type_isObjectPointerType(CXType_ T);

bool clang_Type_isFunctionPointerType(CXType_ T);

bool clang_Type_isFunctionReferenceType(CXType_ T);

bool clang_Type_isMemberPointerType(CXType_ T);

bool clang_Type_isMemberFunctionPointerType(CXType_ T);

bool clang_Type_isMemberDataPointerType(CXType_ T);

bool clang_Type_isArrayType(CXType_ T);

bool clang_Type_isConstantArrayType(CXType_ T);

bool clang_Type_isIncompleteArrayType(CXType_ T);

bool clang_Type_isVariableArrayType(CXType_ T);

bool clang_Type_isDependentSizedArrayType(CXType_ T);

bool clang_Type_isRecordType(CXType_ T);

bool clang_Type_isClassType(CXType_ T);

bool clang_Type_isStructureType(CXType_ T);

bool clang_Type_isObjCBoxableRecordType(CXType_ T);

bool clang_Type_isInterfaceType(CXType_ T);

bool clang_Type_isStructureOrClassType(CXType_ T);

bool clang_Type_isUnionType(CXType_ T);

bool clang_Type_isComplexIntegerType(CXType_ T);

bool clang_Type_isVectorType(CXType_ T);

bool clang_Type_isExtVectorType(CXType_ T);

// isExtVectorBoolType

bool clang_Type_isMatrixType(CXType_ T);

bool clang_Type_isConstantMatrixType(CXType_ T);

bool clang_Type_isDependentAddressSpaceType(CXType_ T);

// isObjCObjectPointerType

// isObjCRetainableType

// isObjCLifetimeType

// isObjCIndirectLifetimeType

// isObjCNSObjectType

// isObjCIndependentClassType

// isObjCObjectType

// isObjCQualifiedInterfaceType

// isObjCQualifiedIdType

// isObjCQualifiedClassType

// isObjCObjectOrInterfaceType

// isObjCIdType

bool clang_Type_isDecltypeType(CXType_ T);

// isObjCInertUnsafeUnretainedType

// isObjCIdOrObjectKindOfType

// isObjCClassType

// isObjCClassOrClassKindOfType

// isBlockCompatibleObjCPointerType

// isObjCSelType

// isObjCBuiltinType

// isObjCARCBridgableType

// isCARCBridgableType

bool clang_Type_isTemplateTypeParmType(CXType_ T);

bool clang_Type_isNullPtrType(CXType_ T);

bool clang_Type_isNothrowT(CXType_ T);

bool clang_Type_isAlignValT(CXType_ T);

bool clang_Type_isStdByteType(CXType_ T);

bool clang_Type_isAtomicType(CXType_ T);

bool clang_Type_isUndeducedAutoType(CXType_ T);

bool clang_Type_isTypedefNameType(CXType_ T);

// clang/Basic/OpenCLImageTypes.def

// isImageType

// isSamplerT

// isEventT

// isClkEventT

// isQueueT

// isReserveIDT

// clang/Basic/OpenCLExtensionTypes.def

// isOCLIntelSubgroupAVCType

// isOCLExtOpaqueType

// isPipeType

// isBitIntType

// isOpenCLSpecificType

// isObjCARCImplicitlyUnretainedType

// isCUDADeviceBuiltinSurfaceType

// isCUDADeviceBuiltinTextureType

// isRVVType

// containsErrors

bool clang_Type_isDependentType(CXType_ T);

bool clang_Type_isInstantiationDependentType(CXType_ T);

bool clang_Type_isUndeducedType(CXType_ T);

bool clang_Type_isVariablyModifiedType(CXType_ T);

bool clang_Type_hasSizedVLAType(CXType_ T);

bool clang_Type_hasUnnamedOrLocalType(CXType_ T);

bool clang_Type_isOverloadableType(CXType_ T);

bool clang_Type_isElaboratedTypeSpecifier(CXType_ T);

bool clang_Type_canDecayToPointerType(CXType_ T);

bool clang_Type_hasPointerRepresentation(CXType_ T);

bool clang_Type_hasObjCPointerRepresentation(CXType_ T);

bool clang_Type_hasIntegerRepresentation(CXType_ T);

bool clang_Type_hasSignedIntegerRepresentation(CXType_ T);

bool clang_Type_hasUnsignedIntegerRepresentation(CXType_ T);

bool clang_Type_hasFloatingRepresentation(CXType_ T);

CXRecordType clang_Type_getAsStructureType(CXType_ T);

CXRecordType clang_Type_getAsUnionType(CXType_ T);

CXComplexType clang_Type_getAsComplexIntegerType(CXType_ T);

// getAsObjCInterfaceType

// getAsObjCInterfacePointerType

// getAsObjCQualifiedIdType

// getAsObjCQualifiedClassType

// getAsObjCQualifiedInterfaceType

CXCXXRecordDecl clang_Type_getAsCXXRecordDecl(CXType_ T);

CXRecordDecl clang_Type_getAsRecordDecl(CXType_ T);

CXTagDecl clang_Type_getAsTagDecl(CXType_ T);

CXCXXRecordDecl clang_Type_getPointeeCXXRecordDecl(CXType_ T);

CXDeducedType clang_Type_getContainedDeducedType(CXType_ T);

// getContainedAutoType

bool clang_Type_hasAutoForTrailingReturnType(CXType_ T);

// getAsArrayTypeUnsafe

// castAsArrayTypeUnsafe

// hasAttr

// getBaseElementTypeUnsafe

CXType_ clang_Type_getArrayElementTypeNoTypeQual(CXType_ T);

CXType_ clang_Type_getPointeeOrArrayElementType(CXType_ T);

CXQualType clang_Type_getPointeeType(CXType_ T);

CXType_ clang_Type_getUnqualifiedDesugaredType(CXType_ T);

bool clang_Type_isSignedIntegerType(CXType_ T);

bool clang_Type_isUnsignedIntegerType(CXType_ T);

bool clang_Type_isSignedIntegerOrEnumerationType(CXType_ T);

bool clang_Type_isUnsignedIntegerOrEnumerationType(CXType_ T);

bool clang_Type_isFixedPointType(CXType_ T);

bool clang_Type_isFixedPointOrIntegerType(CXType_ T);

bool clang_Type_isSaturatedFixedPointType(CXType_ T);

bool clang_Type_isUnsaturatedFixedPointType(CXType_ T);

bool clang_Type_isSignedFixedPointType(CXType_ T);

bool clang_Type_isUnsignedFixedPointType(CXType_ T);

bool clang_Type_isConstantSizeType(CXType_ T);

bool clang_Type_isSpecifierType(CXType_ T);

// getLinkage

// getVisibility

bool clang_Type_isVisibilityExplicit(CXType_ T);

// getLinkageAndVisibility

bool clang_Type_isLinkageValid(CXType_ T);

// getNullability

// canHaveNullability

// acceptsObjCTypeParams

// getresolveName

CXQualType clang_Type_getCanonicalTypeInternal(CXType_ T);

void clang_Type_dump(CXType_ T);

// isa
bool clang_isa_PointerType(CXType_ T);

bool clang_isa_ReferenceType(CXType_ T);

bool clang_isa_ArrayType(CXType_ T);

bool clang_isa_UnresolvedUsingType(CXType_ T);

bool clang_isa_TypedefType(CXType_ T);

bool clang_isa_DecltypeType(CXType_ T);

bool clang_isa_DependentDecltypeType(CXType_ T);

bool clang_isa_TagType(CXType_ T);

bool clang_isa_RecordType(CXType_ T);

bool clang_isa_EnumType(CXType_ T);

bool clang_isa_TemplateTypeParmType(CXType_ T);

bool clang_isa_SubstTemplateTypeParmType(CXType_ T);

bool clang_isa_SubstTemplateTypeParmPackType(CXType_ T);

bool clang_isa_DeducedType(CXType_ T);

bool clang_isa_AutoType(CXType_ T);

bool clang_isa_DeducedTemplateSpecializationType(CXType_ T);

bool clang_isa_TemplateSpecializationType(CXType_ T);

bool clang_isa_ElaboratedType(CXType_ T);

bool clang_isa_DependentNameType(CXType_ T);

bool clang_isa_DependentTemplateSpecializationType(CXType_ T);

// BuiltinTypes
bool clang_isa_BuiltinType_Void(CXType_ T);

bool clang_isa_BuiltinType_Bool(CXType_ T);

bool clang_isa_BuiltinType_Char_U(CXType_ T);

bool clang_isa_BuiltinType_UChar(CXType_ T);

bool clang_isa_BuiltinType_WChar_U(CXType_ T);

bool clang_isa_BuiltinType_Char8(CXType_ T);

bool clang_isa_BuiltinType_Char16(CXType_ T);

bool clang_isa_BuiltinType_Char32(CXType_ T);

bool clang_isa_BuiltinType_UShort(CXType_ T);

bool clang_isa_BuiltinType_UInt(CXType_ T);

bool clang_isa_BuiltinType_ULong(CXType_ T);

bool clang_isa_BuiltinType_ULongLong(CXType_ T);

bool clang_isa_BuiltinType_UInt128(CXType_ T);

bool clang_isa_BuiltinType_Char_S(CXType_ T);

bool clang_isa_BuiltinType_SChar(CXType_ T);

bool clang_isa_BuiltinType_WChar_S(CXType_ T);

bool clang_isa_BuiltinType_Short(CXType_ T);

bool clang_isa_BuiltinType_Int(CXType_ T);

bool clang_isa_BuiltinType_Long(CXType_ T);

bool clang_isa_BuiltinType_LongLong(CXType_ T);

bool clang_isa_BuiltinType_Int128(CXType_ T);

bool clang_isa_BuiltinType_Half(CXType_ T);

bool clang_isa_BuiltinType_Float(CXType_ T);

bool clang_isa_BuiltinType_Double(CXType_ T);

bool clang_isa_BuiltinType_LongDouble(CXType_ T);

bool clang_isa_BuiltinType_Float16(CXType_ T);

bool clang_isa_BuiltinType_BFloat16(CXType_ T);

bool clang_isa_BuiltinType_Float128(CXType_ T);

bool clang_isa_BuiltinType_NullPtr(CXType_ T);

// ComplexType
// getElementType
// isSugared

// ParenType
// getInnerType

// PointerType
CXQualType clang_PointerType_getPointeeType(CXPointerType T);

// AdjustedType
// getOriginalType
// getAdjustedType

// DecayedType
// getDecayedType

// ReferenceType
// isSpelledAsLValue
// isInnerRef
// getPointeeTypeAsWritten
CXQualType clang_ReferenceType_getPointeeType(CXReferenceType T);

// LValueReferenceType
// RValueReferenceType

// MemberPointerType
CXQualType clang_MemberPointerType_getPointeeType(CXMemberPointerType T);
// isMemberFunctionPointer
// isMemberDataPointer
CXType_ clang_MemberPointerType_getClass(CXMemberPointerType T);
// getMostRecentCXXRecordDecl

// ArrayType
// getElementType
// getIndexTypeCVRQualifiers

// ConstantArrayType
// getSize
// getSizeExpr

// IncompleteArrayType

// VariableArrayType

// DependentSizedArrayType

// DependentAddressSpaceType

// DependentSizedExtVectorType

// VectorType
// getElementType
// getNumElements

// DependentVectorType
// getElementType

// ExtVectorType

// MatrixType
// getElementType

// ConstantMatrixType
// getNumRows
// getNumColumns
// getNumElementsFlattened

// DependentSizedMatrixType

// FunctionType
CXQualType clang_FunctionType_getReturnType(CXFunctionType T);
// getHasRegParm
// getRegParmType
// getNoReturnAttr
// getCmseNSCallAttr
// getCallResultType
// getNameForCallConv

// FunctionNoProtoType

// FunctionProtoType
unsigned clang_FunctionProtoType_getNumParams(CXFunctionProtoType T);

CXQualType clang_FunctionProtoType_getParamType(CXFunctionProtoType T, unsigned i);
// getParamTypes
// ...
// isVariadic
// isTemplateVariadic

// UnresolvedUsingType

// UsingType
// getUnderlyingType

// TypedefType
// getDecl
CXQualType clang_TypedefType_desugar(CXTypedefType T);

// MacroQualifiedType
// getUnderlyingType
// getModifiedType

// TypeOfExprType

// DependentTypeOfExprType

// TypeOfType
// getUnmodifiedType

// DecltypeType
// getUnderlyingType

// DependentDecltypeType

// UnaryTransformType
// getUnderlyingType
// getBaseType

// DependentUnaryTransformType

// TagType
CXTagDecl clang_TagType_getDecl(CXTagType T);

// isBeingDefined

// RecordType
CXRecordDecl clang_RecordType_getDecl(CXRecordType T);

// hasConstFields

// EnumType
CXEnumDecl clang_EnumType_getDecl(CXEnumType T);

// AttributedType

// BTFTagAttributedType

// TemplateTypeParmType

// SubstTemplateTypeParmType
CXQualType
clang_SubstTemplateTypeParmType_getReplacementType(CXSubstTemplateTypeParmType T);

CXQualType clang_SubstTemplateTypeParmType_desugar(CXSubstTemplateTypeParmType T);

// SubstTemplateTypeParmPackType

// DeducedType

// AutoType

// DeducedTemplateSpecializationType

// TemplateSpecializationType
bool clang_TemplateSpecializationType_isCurrentInstantiation(
    CXTemplateSpecializationType T);

bool clang_TemplateSpecializationType_isTypeAlias(CXTemplateSpecializationType T);

CXQualType clang_TemplateSpecializationType_getAliasedType(CXTemplateSpecializationType T);

CXTemplateName
clang_TemplateSpecializationType_getTemplateName(CXTemplateSpecializationType T);

CXArrayRef
clang_TemplateSpecializationType_template_arguments(CXTemplateSpecializationType T);

bool clang_TemplateSpecializationType_isSugared(CXTemplateSpecializationType T);

CXQualType clang_TemplateSpecializationType_desugar(CXTemplateSpecializationType T);

// InjectedClassNameType

// TypeWithKeyword

// ElaboratedType
// getQualifier
// getNamedType
CXQualType clang_ElaboratedType_desugar(CXElaboratedType T);
// getOwnedTagDecl

// DependentNameType

// DependentTemplateSpecializationType

// PackExpansionType

// AtomicType

// TagTypeKind
typedef enum CXTagTypeKind {
  CXTagTypeKind_TTK_Struct,
  CXTagTypeKind_TTK_Interface,
  CXTagTypeKind_TTK_Union,
  CXTagTypeKind_TTK_Class,
  CXTagTypeKind_TTK_Enum
} CXTagTypeKind;

// ElaboratedTypeKeyword
typedef enum CXElaboratedTypeKeyword {
  CXElaboratedTypeKeyword_ETK_Struct,
  CXElaboratedTypeKeyword_ETK_Interface,
  CXElaboratedTypeKeyword_ETK_Union,
  CXElaboratedTypeKeyword_ETK_Class,
  CXElaboratedTypeKeyword_ETK_Enum,
  CXElaboratedTypeKeyword_ETK_Typename,
  CXElaboratedTypeKeyword_ETK_None
} CXElaboratedTypeKeyword;

LLVM_CLANG_C_EXTERN_C_END

#endif