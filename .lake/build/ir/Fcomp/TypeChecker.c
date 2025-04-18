// Lean compiler output
// Module: Fcomp.TypeChecker
// Imports: Init Fcomp.Types Fcomp.Terms Fcomp.Context
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__8;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__5;
LEAN_EXPORT lean_object* l_Fcomp_STLC_instBEqTy__1;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__12;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__2;
lean_object* l_Fcomp_STLC_Context_extend(lean_object*, lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC_apply__id__to__true___closed__2;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__9;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__15;
LEAN_EXPORT lean_object* l___private_Fcomp_TypeChecker_0__Fcomp_STLC_Ty_beq_match__1_splitter___rarg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Lean_replaceRef(lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__2;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__16;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__13;
lean_object* l_Lean_Syntax_node5(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
uint8_t l_Lean_Syntax_isOfKind(lean_object*, lean_object*);
uint8_t lean_string_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1(lean_object*, lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__14;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__15;
static lean_object* l_Fcomp_STLC_apply__id__to__true___closed__1;
LEAN_EXPORT lean_object* l___private_Fcomp_TypeChecker_0__Fcomp_STLC_Ty_beq_match__1_splitter(lean_object*);
LEAN_EXPORT lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___boxed(lean_object*, lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__14;
lean_object* l_Lean_Name_mkStr3(lean_object*, lean_object*, lean_object*);
lean_object* l_Lean_SourceInfo_fromRef(lean_object*, uint8_t);
LEAN_EXPORT uint8_t l_Fcomp_STLC_Ty_beq(lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__6;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__4;
static lean_object* l_Fcomp_STLC_apply__id__to__true___closed__6;
lean_object* l_Fcomp_STLC_Context_lookup(lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__8;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__10;
lean_object* l_Lean_Syntax_node3(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Lean_addMacroScope(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Fcomp_STLC_Ty_beq___boxed(lean_object*, lean_object*);
lean_object* l_Lean_Name_str___override(lean_object*, lean_object*);
lean_object* l_Lean_Syntax_node2(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC_apply__id__to__true___closed__4;
lean_object* l_Lean_Syntax_getArg(lean_object*, lean_object*);
uint8_t l_Lean_Syntax_matchesNull(lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__9;
static lean_object* l_Fcomp_STLC_apply__id__to__true___closed__3;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__1;
LEAN_EXPORT lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1(lean_object*, lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__17;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__12;
LEAN_EXPORT lean_object* l_Fcomp_STLC_typeOf(lean_object*, lean_object*);
extern lean_object* l_Fcomp_STLC_boolTy;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__13;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__1;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__3;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__16;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__5;
static lean_object* l_Fcomp_STLC_instBEqTy__1___closed__1;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__3;
static lean_object* l_Fcomp_STLC_typeOf___closed__1;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__7;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__4;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__11;
LEAN_EXPORT lean_object* l_Fcomp_STLC_term___u22a2___x3a__;
static lean_object* l_Fcomp_STLC_apply__id__to__true___closed__5;
LEAN_EXPORT lean_object* l_Fcomp_STLC_apply__id__to__true;
lean_object* l_Lean_Name_mkStr4(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__2;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__6;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__7;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__1;
static lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__11;
static lean_object* l_Fcomp_STLC_term___u22a2___x3a_____closed__10;
lean_object* l_String_toSubstring_x27(lean_object*);
LEAN_EXPORT uint8_t l_Fcomp_STLC_Ty_beq(lean_object* x_1, lean_object* x_2) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = lean_ctor_get(x_1, 0);
x_4 = lean_ctor_get(x_2, 0);
x_5 = lean_string_dec_eq(x_3, x_4);
return x_5;
}
else
{
uint8_t x_6; 
x_6 = 0;
return x_6;
}
}
case 1:
{
if (lean_obj_tag(x_2) == 1)
{
lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; uint8_t x_11; 
x_7 = lean_ctor_get(x_1, 0);
x_8 = lean_ctor_get(x_1, 1);
x_9 = lean_ctor_get(x_2, 0);
x_10 = lean_ctor_get(x_2, 1);
x_11 = l_Fcomp_STLC_Ty_beq(x_7, x_9);
if (x_11 == 0)
{
uint8_t x_12; 
x_12 = 0;
return x_12;
}
else
{
x_1 = x_8;
x_2 = x_10;
goto _start;
}
}
else
{
uint8_t x_14; 
x_14 = 0;
return x_14;
}
}
default: 
{
uint8_t x_15; 
x_15 = 0;
return x_15;
}
}
}
}
LEAN_EXPORT lean_object* l_Fcomp_STLC_Ty_beq___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_Fcomp_STLC_Ty_beq(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_instBEqTy__1___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_Fcomp_STLC_Ty_beq___boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_instBEqTy__1() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_instBEqTy__1___closed__1;
return x_1;
}
}
LEAN_EXPORT lean_object* l___private_Fcomp_TypeChecker_0__Fcomp_STLC_Ty_beq_match__1_splitter___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5) {
_start:
{
switch (lean_obj_tag(x_1)) {
case 0:
{
lean_dec(x_4);
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; 
lean_dec(x_5);
x_6 = lean_ctor_get(x_1, 0);
lean_inc(x_6);
lean_dec(x_1);
x_7 = lean_ctor_get(x_2, 0);
lean_inc(x_7);
lean_dec(x_2);
x_8 = lean_apply_2(x_3, x_6, x_7);
return x_8;
}
else
{
lean_object* x_9; 
lean_dec(x_3);
x_9 = lean_apply_4(x_5, x_1, x_2, lean_box(0), lean_box(0));
return x_9;
}
}
case 1:
{
lean_dec(x_3);
if (lean_obj_tag(x_2) == 1)
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
lean_dec(x_5);
x_10 = lean_ctor_get(x_1, 0);
lean_inc(x_10);
x_11 = lean_ctor_get(x_1, 1);
lean_inc(x_11);
lean_dec(x_1);
x_12 = lean_ctor_get(x_2, 0);
lean_inc(x_12);
x_13 = lean_ctor_get(x_2, 1);
lean_inc(x_13);
lean_dec(x_2);
x_14 = lean_apply_4(x_4, x_10, x_11, x_12, x_13);
return x_14;
}
else
{
lean_object* x_15; 
lean_dec(x_4);
x_15 = lean_apply_4(x_5, x_1, x_2, lean_box(0), lean_box(0));
return x_15;
}
}
default: 
{
lean_object* x_16; 
lean_dec(x_4);
lean_dec(x_3);
x_16 = lean_apply_4(x_5, x_1, x_2, lean_box(0), lean_box(0));
return x_16;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Fcomp_TypeChecker_0__Fcomp_STLC_Ty_beq_match__1_splitter(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l___private_Fcomp_TypeChecker_0__Fcomp_STLC_Ty_beq_match__1_splitter___rarg), 5, 0);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("Fcomp", 5);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__2() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("STLC", 4);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__3() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("term_⊢_:_", 11);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_term___u22a2___x3a_____closed__1;
x_2 = l_Fcomp_STLC_term___u22a2___x3a_____closed__2;
x_3 = l_Fcomp_STLC_term___u22a2___x3a_____closed__3;
x_4 = l_Lean_Name_mkStr3(x_1, x_2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__5() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("andthen", 7);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_Fcomp_STLC_term___u22a2___x3a_____closed__5;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__7() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes(" ⊢ ", 5);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_term___u22a2___x3a_____closed__7;
x_2 = lean_alloc_ctor(5, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__9() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("term", 4);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_Fcomp_STLC_term___u22a2___x3a_____closed__9;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_term___u22a2___x3a_____closed__10;
x_2 = lean_unsigned_to_nat(0u);
x_3 = lean_alloc_ctor(7, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__12() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_term___u22a2___x3a_____closed__6;
x_2 = l_Fcomp_STLC_term___u22a2___x3a_____closed__8;
x_3 = l_Fcomp_STLC_term___u22a2___x3a_____closed__11;
x_4 = lean_alloc_ctor(2, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__13() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes(" : ", 3);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__14() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_term___u22a2___x3a_____closed__13;
x_2 = lean_alloc_ctor(5, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__15() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_term___u22a2___x3a_____closed__6;
x_2 = l_Fcomp_STLC_term___u22a2___x3a_____closed__12;
x_3 = l_Fcomp_STLC_term___u22a2___x3a_____closed__14;
x_4 = lean_alloc_ctor(2, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__16() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_term___u22a2___x3a_____closed__6;
x_2 = l_Fcomp_STLC_term___u22a2___x3a_____closed__15;
x_3 = l_Fcomp_STLC_term___u22a2___x3a_____closed__11;
x_4 = lean_alloc_ctor(2, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__17() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = l_Fcomp_STLC_term___u22a2___x3a_____closed__4;
x_2 = lean_unsigned_to_nat(50u);
x_3 = lean_unsigned_to_nat(0u);
x_4 = l_Fcomp_STLC_term___u22a2___x3a_____closed__16;
x_5 = lean_alloc_ctor(4, 4, 0);
lean_ctor_set(x_5, 0, x_1);
lean_ctor_set(x_5, 1, x_2);
lean_ctor_set(x_5, 2, x_3);
lean_ctor_set(x_5, 3, x_4);
return x_5;
}
}
static lean_object* _init_l_Fcomp_STLC_term___u22a2___x3a__() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_term___u22a2___x3a_____closed__17;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("Lean", 4);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__2() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("Parser", 6);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__3() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("Term", 4);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__4() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("app", 3);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__1;
x_2 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__2;
x_3 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__3;
x_4 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__4;
x_5 = l_Lean_Name_mkStr4(x_1, x_2, x_3, x_4);
return x_5;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__6() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("HasType", 7);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__6;
x_2 = l_String_toSubstring_x27(x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__6;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_term___u22a2___x3a_____closed__1;
x_2 = l_Fcomp_STLC_term___u22a2___x3a_____closed__2;
x_3 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__6;
x_4 = l_Lean_Name_mkStr3(x_1, x_2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__9;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__9;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__12() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__11;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__13() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__11;
x_2 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__12;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__14() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__10;
x_2 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__13;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__15() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("null", 4);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__16() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__15;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = l_Fcomp_STLC_term___u22a2___x3a_____closed__4;
lean_inc(x_1);
x_5 = l_Lean_Syntax_isOfKind(x_1, x_4);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; 
lean_dec(x_2);
lean_dec(x_1);
x_6 = lean_box(1);
x_7 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_7, 0, x_6);
lean_ctor_set(x_7, 1, x_3);
return x_7;
}
else
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; uint8_t x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; 
x_8 = lean_unsigned_to_nat(0u);
x_9 = l_Lean_Syntax_getArg(x_1, x_8);
x_10 = lean_unsigned_to_nat(2u);
x_11 = l_Lean_Syntax_getArg(x_1, x_10);
x_12 = lean_unsigned_to_nat(4u);
x_13 = l_Lean_Syntax_getArg(x_1, x_12);
lean_dec(x_1);
x_14 = lean_ctor_get(x_2, 5);
lean_inc(x_14);
x_15 = 0;
x_16 = l_Lean_SourceInfo_fromRef(x_14, x_15);
x_17 = lean_ctor_get(x_2, 2);
lean_inc(x_17);
x_18 = lean_ctor_get(x_2, 1);
lean_inc(x_18);
lean_dec(x_2);
x_19 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__8;
x_20 = l_Lean_addMacroScope(x_18, x_19, x_17);
x_21 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__7;
x_22 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__14;
lean_inc(x_16);
x_23 = lean_alloc_ctor(3, 4, 0);
lean_ctor_set(x_23, 0, x_16);
lean_ctor_set(x_23, 1, x_21);
lean_ctor_set(x_23, 2, x_20);
lean_ctor_set(x_23, 3, x_22);
x_24 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__16;
lean_inc(x_16);
x_25 = l_Lean_Syntax_node3(x_16, x_24, x_9, x_11, x_13);
x_26 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__5;
x_27 = l_Lean_Syntax_node2(x_16, x_26, x_23, x_25);
x_28 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_28, 0, x_27);
lean_ctor_set(x_28, 1, x_3);
return x_28;
}
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("ident", 5);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__1;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__5;
lean_inc(x_1);
x_5 = l_Lean_Syntax_isOfKind(x_1, x_4);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; 
lean_dec(x_1);
x_6 = lean_box(0);
x_7 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_7, 0, x_6);
lean_ctor_set(x_7, 1, x_3);
return x_7;
}
else
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; uint8_t x_11; 
x_8 = lean_unsigned_to_nat(0u);
x_9 = l_Lean_Syntax_getArg(x_1, x_8);
x_10 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__2;
lean_inc(x_9);
x_11 = l_Lean_Syntax_isOfKind(x_9, x_10);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; 
lean_dec(x_9);
lean_dec(x_1);
x_12 = lean_box(0);
x_13 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_13, 0, x_12);
lean_ctor_set(x_13, 1, x_3);
return x_13;
}
else
{
lean_object* x_14; lean_object* x_15; lean_object* x_16; uint8_t x_17; 
x_14 = lean_unsigned_to_nat(1u);
x_15 = l_Lean_Syntax_getArg(x_1, x_14);
lean_dec(x_1);
x_16 = lean_unsigned_to_nat(3u);
lean_inc(x_15);
x_17 = l_Lean_Syntax_matchesNull(x_15, x_16);
if (x_17 == 0)
{
lean_object* x_18; lean_object* x_19; 
lean_dec(x_15);
lean_dec(x_9);
x_18 = lean_box(0);
x_19 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_19, 0, x_18);
lean_ctor_set(x_19, 1, x_3);
return x_19;
}
else
{
lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; uint8_t x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; lean_object* x_32; lean_object* x_33; 
x_20 = l_Lean_Syntax_getArg(x_15, x_8);
x_21 = l_Lean_Syntax_getArg(x_15, x_14);
x_22 = lean_unsigned_to_nat(2u);
x_23 = l_Lean_Syntax_getArg(x_15, x_22);
lean_dec(x_15);
x_24 = l_Lean_replaceRef(x_9, x_2);
lean_dec(x_9);
x_25 = 0;
x_26 = l_Lean_SourceInfo_fromRef(x_24, x_25);
x_27 = l_Fcomp_STLC_term___u22a2___x3a_____closed__7;
lean_inc(x_26);
x_28 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_28, 0, x_26);
lean_ctor_set(x_28, 1, x_27);
x_29 = l_Fcomp_STLC_term___u22a2___x3a_____closed__13;
lean_inc(x_26);
x_30 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_30, 0, x_26);
lean_ctor_set(x_30, 1, x_29);
x_31 = l_Fcomp_STLC_term___u22a2___x3a_____closed__4;
x_32 = l_Lean_Syntax_node5(x_26, x_31, x_20, x_28, x_21, x_30, x_23);
x_33 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_33, 0, x_32);
lean_ctor_set(x_33, 1, x_3);
return x_33;
}
}
}
}
}
LEAN_EXPORT lean_object* l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1(x_1, x_2, x_3);
lean_dec(x_2);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_typeOf___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_box(2);
x_2 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Fcomp_STLC_typeOf(lean_object* x_1, lean_object* x_2) {
_start:
{
switch (lean_obj_tag(x_2)) {
case 0:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_ctor_get(x_2, 0);
lean_inc(x_3);
lean_dec(x_2);
x_4 = l_Fcomp_STLC_Context_lookup(x_1, x_3);
return x_4;
}
case 1:
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_5 = lean_ctor_get(x_2, 0);
lean_inc(x_5);
x_6 = lean_ctor_get(x_2, 1);
lean_inc(x_6);
x_7 = lean_ctor_get(x_2, 2);
lean_inc(x_7);
lean_dec(x_2);
lean_inc(x_6);
x_8 = l_Fcomp_STLC_Context_extend(x_1, x_5, x_6);
x_9 = l_Fcomp_STLC_typeOf(x_8, x_7);
if (lean_obj_tag(x_9) == 0)
{
lean_object* x_10; 
lean_dec(x_6);
x_10 = lean_box(0);
return x_10;
}
else
{
uint8_t x_11; 
x_11 = !lean_is_exclusive(x_9);
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; 
x_12 = lean_ctor_get(x_9, 0);
x_13 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_13, 0, x_6);
lean_ctor_set(x_13, 1, x_12);
lean_ctor_set(x_9, 0, x_13);
return x_9;
}
else
{
lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_14 = lean_ctor_get(x_9, 0);
lean_inc(x_14);
lean_dec(x_9);
x_15 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_15, 0, x_6);
lean_ctor_set(x_15, 1, x_14);
x_16 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_16, 0, x_15);
return x_16;
}
}
}
case 2:
{
lean_object* x_17; lean_object* x_18; lean_object* x_19; 
x_17 = lean_ctor_get(x_2, 0);
lean_inc(x_17);
x_18 = lean_ctor_get(x_2, 1);
lean_inc(x_18);
lean_dec(x_2);
lean_inc(x_1);
x_19 = l_Fcomp_STLC_typeOf(x_1, x_17);
if (lean_obj_tag(x_19) == 0)
{
lean_object* x_20; 
lean_dec(x_18);
lean_dec(x_1);
x_20 = lean_box(0);
return x_20;
}
else
{
lean_object* x_21; 
x_21 = lean_ctor_get(x_19, 0);
lean_inc(x_21);
lean_dec(x_19);
if (lean_obj_tag(x_21) == 1)
{
lean_object* x_22; lean_object* x_23; lean_object* x_24; 
x_22 = lean_ctor_get(x_21, 0);
lean_inc(x_22);
x_23 = lean_ctor_get(x_21, 1);
lean_inc(x_23);
lean_dec(x_21);
x_24 = l_Fcomp_STLC_typeOf(x_1, x_18);
if (lean_obj_tag(x_24) == 0)
{
lean_object* x_25; 
lean_dec(x_23);
lean_dec(x_22);
x_25 = lean_box(0);
return x_25;
}
else
{
uint8_t x_26; 
x_26 = !lean_is_exclusive(x_24);
if (x_26 == 0)
{
lean_object* x_27; uint8_t x_28; 
x_27 = lean_ctor_get(x_24, 0);
x_28 = l_Fcomp_STLC_Ty_beq(x_22, x_27);
lean_dec(x_27);
lean_dec(x_22);
if (x_28 == 0)
{
lean_object* x_29; 
lean_free_object(x_24);
lean_dec(x_23);
x_29 = lean_box(0);
return x_29;
}
else
{
lean_ctor_set(x_24, 0, x_23);
return x_24;
}
}
else
{
lean_object* x_30; uint8_t x_31; 
x_30 = lean_ctor_get(x_24, 0);
lean_inc(x_30);
lean_dec(x_24);
x_31 = l_Fcomp_STLC_Ty_beq(x_22, x_30);
lean_dec(x_30);
lean_dec(x_22);
if (x_31 == 0)
{
lean_object* x_32; 
lean_dec(x_23);
x_32 = lean_box(0);
return x_32;
}
else
{
lean_object* x_33; 
x_33 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_33, 0, x_23);
return x_33;
}
}
}
}
else
{
lean_object* x_34; 
lean_dec(x_21);
lean_dec(x_18);
lean_dec(x_1);
x_34 = lean_box(0);
return x_34;
}
}
}
case 3:
{
lean_object* x_35; 
lean_dec(x_1);
x_35 = l_Fcomp_STLC_typeOf___closed__1;
return x_35;
}
case 4:
{
lean_object* x_36; lean_object* x_37; lean_object* x_38; 
x_36 = lean_ctor_get(x_2, 0);
lean_inc(x_36);
x_37 = lean_ctor_get(x_2, 1);
lean_inc(x_37);
lean_dec(x_2);
lean_inc(x_1);
x_38 = l_Fcomp_STLC_typeOf(x_1, x_36);
if (lean_obj_tag(x_38) == 0)
{
lean_object* x_39; 
lean_dec(x_37);
lean_dec(x_1);
x_39 = lean_box(0);
return x_39;
}
else
{
lean_object* x_40; lean_object* x_41; 
x_40 = lean_ctor_get(x_38, 0);
lean_inc(x_40);
lean_dec(x_38);
x_41 = l_Fcomp_STLC_typeOf(x_1, x_37);
if (lean_obj_tag(x_41) == 0)
{
lean_object* x_42; 
lean_dec(x_40);
x_42 = lean_box(0);
return x_42;
}
else
{
uint8_t x_43; 
x_43 = !lean_is_exclusive(x_41);
if (x_43 == 0)
{
lean_object* x_44; lean_object* x_45; 
x_44 = lean_ctor_get(x_41, 0);
x_45 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_45, 0, x_40);
lean_ctor_set(x_45, 1, x_44);
lean_ctor_set(x_41, 0, x_45);
return x_41;
}
else
{
lean_object* x_46; lean_object* x_47; lean_object* x_48; 
x_46 = lean_ctor_get(x_41, 0);
lean_inc(x_46);
lean_dec(x_41);
x_47 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_47, 0, x_40);
lean_ctor_set(x_47, 1, x_46);
x_48 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_48, 0, x_47);
return x_48;
}
}
}
}
case 5:
{
lean_object* x_49; lean_object* x_50; 
x_49 = lean_ctor_get(x_2, 0);
lean_inc(x_49);
lean_dec(x_2);
x_50 = l_Fcomp_STLC_typeOf(x_1, x_49);
if (lean_obj_tag(x_50) == 0)
{
lean_object* x_51; 
x_51 = lean_box(0);
return x_51;
}
else
{
uint8_t x_52; 
x_52 = !lean_is_exclusive(x_50);
if (x_52 == 0)
{
lean_object* x_53; 
x_53 = lean_ctor_get(x_50, 0);
if (lean_obj_tag(x_53) == 4)
{
lean_object* x_54; 
x_54 = lean_ctor_get(x_53, 0);
lean_inc(x_54);
lean_dec(x_53);
lean_ctor_set(x_50, 0, x_54);
return x_50;
}
else
{
lean_object* x_55; 
lean_free_object(x_50);
lean_dec(x_53);
x_55 = lean_box(0);
return x_55;
}
}
else
{
lean_object* x_56; 
x_56 = lean_ctor_get(x_50, 0);
lean_inc(x_56);
lean_dec(x_50);
if (lean_obj_tag(x_56) == 4)
{
lean_object* x_57; lean_object* x_58; 
x_57 = lean_ctor_get(x_56, 0);
lean_inc(x_57);
lean_dec(x_56);
x_58 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_58, 0, x_57);
return x_58;
}
else
{
lean_object* x_59; 
lean_dec(x_56);
x_59 = lean_box(0);
return x_59;
}
}
}
}
case 6:
{
lean_object* x_60; lean_object* x_61; 
x_60 = lean_ctor_get(x_2, 0);
lean_inc(x_60);
lean_dec(x_2);
x_61 = l_Fcomp_STLC_typeOf(x_1, x_60);
if (lean_obj_tag(x_61) == 0)
{
lean_object* x_62; 
x_62 = lean_box(0);
return x_62;
}
else
{
uint8_t x_63; 
x_63 = !lean_is_exclusive(x_61);
if (x_63 == 0)
{
lean_object* x_64; 
x_64 = lean_ctor_get(x_61, 0);
if (lean_obj_tag(x_64) == 4)
{
lean_object* x_65; 
x_65 = lean_ctor_get(x_64, 1);
lean_inc(x_65);
lean_dec(x_64);
lean_ctor_set(x_61, 0, x_65);
return x_61;
}
else
{
lean_object* x_66; 
lean_free_object(x_61);
lean_dec(x_64);
x_66 = lean_box(0);
return x_66;
}
}
else
{
lean_object* x_67; 
x_67 = lean_ctor_get(x_61, 0);
lean_inc(x_67);
lean_dec(x_61);
if (lean_obj_tag(x_67) == 4)
{
lean_object* x_68; lean_object* x_69; 
x_68 = lean_ctor_get(x_67, 1);
lean_inc(x_68);
lean_dec(x_67);
x_69 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_69, 0, x_68);
return x_69;
}
else
{
lean_object* x_70; 
lean_dec(x_67);
x_70 = lean_box(0);
return x_70;
}
}
}
}
case 7:
{
lean_object* x_71; lean_object* x_72; lean_object* x_73; 
x_71 = lean_ctor_get(x_2, 0);
lean_inc(x_71);
x_72 = lean_ctor_get(x_2, 1);
lean_inc(x_72);
lean_dec(x_2);
x_73 = l_Fcomp_STLC_typeOf(x_1, x_72);
if (lean_obj_tag(x_73) == 0)
{
lean_object* x_74; 
lean_dec(x_71);
x_74 = lean_box(0);
return x_74;
}
else
{
uint8_t x_75; 
x_75 = !lean_is_exclusive(x_73);
if (x_75 == 0)
{
lean_object* x_76; lean_object* x_77; 
x_76 = lean_ctor_get(x_73, 0);
x_77 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_77, 0, x_76);
lean_ctor_set(x_77, 1, x_71);
lean_ctor_set(x_73, 0, x_77);
return x_73;
}
else
{
lean_object* x_78; lean_object* x_79; lean_object* x_80; 
x_78 = lean_ctor_get(x_73, 0);
lean_inc(x_78);
lean_dec(x_73);
x_79 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_79, 0, x_78);
lean_ctor_set(x_79, 1, x_71);
x_80 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_80, 0, x_79);
return x_80;
}
}
}
case 8:
{
lean_object* x_81; lean_object* x_82; lean_object* x_83; 
x_81 = lean_ctor_get(x_2, 0);
lean_inc(x_81);
x_82 = lean_ctor_get(x_2, 1);
lean_inc(x_82);
lean_dec(x_2);
x_83 = l_Fcomp_STLC_typeOf(x_1, x_82);
if (lean_obj_tag(x_83) == 0)
{
lean_object* x_84; 
lean_dec(x_81);
x_84 = lean_box(0);
return x_84;
}
else
{
uint8_t x_85; 
x_85 = !lean_is_exclusive(x_83);
if (x_85 == 0)
{
lean_object* x_86; lean_object* x_87; 
x_86 = lean_ctor_get(x_83, 0);
x_87 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_87, 0, x_81);
lean_ctor_set(x_87, 1, x_86);
lean_ctor_set(x_83, 0, x_87);
return x_83;
}
else
{
lean_object* x_88; lean_object* x_89; lean_object* x_90; 
x_88 = lean_ctor_get(x_83, 0);
lean_inc(x_88);
lean_dec(x_83);
x_89 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_89, 0, x_81);
lean_ctor_set(x_89, 1, x_88);
x_90 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_90, 0, x_89);
return x_90;
}
}
}
case 9:
{
lean_object* x_91; lean_object* x_92; lean_object* x_93; lean_object* x_94; lean_object* x_95; lean_object* x_96; 
x_91 = lean_ctor_get(x_2, 0);
lean_inc(x_91);
x_92 = lean_ctor_get(x_2, 1);
lean_inc(x_92);
x_93 = lean_ctor_get(x_2, 2);
lean_inc(x_93);
x_94 = lean_ctor_get(x_2, 3);
lean_inc(x_94);
x_95 = lean_ctor_get(x_2, 4);
lean_inc(x_95);
lean_dec(x_2);
lean_inc(x_1);
x_96 = l_Fcomp_STLC_typeOf(x_1, x_91);
if (lean_obj_tag(x_96) == 0)
{
lean_object* x_97; 
lean_dec(x_95);
lean_dec(x_94);
lean_dec(x_93);
lean_dec(x_92);
lean_dec(x_1);
x_97 = lean_box(0);
return x_97;
}
else
{
lean_object* x_98; 
x_98 = lean_ctor_get(x_96, 0);
lean_inc(x_98);
lean_dec(x_96);
if (lean_obj_tag(x_98) == 5)
{
lean_object* x_99; lean_object* x_100; lean_object* x_101; lean_object* x_102; 
x_99 = lean_ctor_get(x_98, 0);
lean_inc(x_99);
x_100 = lean_ctor_get(x_98, 1);
lean_inc(x_100);
lean_dec(x_98);
lean_inc(x_1);
x_101 = l_Fcomp_STLC_Context_extend(x_1, x_92, x_99);
x_102 = l_Fcomp_STLC_typeOf(x_101, x_93);
if (lean_obj_tag(x_102) == 0)
{
lean_object* x_103; 
lean_dec(x_100);
lean_dec(x_95);
lean_dec(x_94);
lean_dec(x_1);
x_103 = lean_box(0);
return x_103;
}
else
{
lean_object* x_104; lean_object* x_105; lean_object* x_106; 
x_104 = lean_ctor_get(x_102, 0);
lean_inc(x_104);
lean_dec(x_102);
x_105 = l_Fcomp_STLC_Context_extend(x_1, x_94, x_100);
x_106 = l_Fcomp_STLC_typeOf(x_105, x_95);
if (lean_obj_tag(x_106) == 0)
{
lean_object* x_107; 
lean_dec(x_104);
x_107 = lean_box(0);
return x_107;
}
else
{
uint8_t x_108; 
x_108 = !lean_is_exclusive(x_106);
if (x_108 == 0)
{
lean_object* x_109; uint8_t x_110; 
x_109 = lean_ctor_get(x_106, 0);
x_110 = l_Fcomp_STLC_Ty_beq(x_104, x_109);
lean_dec(x_109);
if (x_110 == 0)
{
lean_object* x_111; 
lean_free_object(x_106);
lean_dec(x_104);
x_111 = lean_box(0);
return x_111;
}
else
{
lean_ctor_set(x_106, 0, x_104);
return x_106;
}
}
else
{
lean_object* x_112; uint8_t x_113; 
x_112 = lean_ctor_get(x_106, 0);
lean_inc(x_112);
lean_dec(x_106);
x_113 = l_Fcomp_STLC_Ty_beq(x_104, x_112);
lean_dec(x_112);
if (x_113 == 0)
{
lean_object* x_114; 
lean_dec(x_104);
x_114 = lean_box(0);
return x_114;
}
else
{
lean_object* x_115; 
x_115 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_115, 0, x_104);
return x_115;
}
}
}
}
}
else
{
lean_object* x_116; 
lean_dec(x_98);
lean_dec(x_95);
lean_dec(x_94);
lean_dec(x_93);
lean_dec(x_92);
lean_dec(x_1);
x_116 = lean_box(0);
return x_116;
}
}
}
default: 
{
lean_object* x_117; lean_object* x_118; lean_object* x_119; 
x_117 = lean_ctor_get(x_2, 0);
lean_inc(x_117);
x_118 = lean_ctor_get(x_2, 1);
lean_inc(x_118);
lean_dec(x_2);
x_119 = l_Fcomp_STLC_typeOf(x_1, x_118);
if (lean_obj_tag(x_119) == 0)
{
lean_object* x_120; 
lean_dec(x_117);
x_120 = lean_box(0);
return x_120;
}
else
{
uint8_t x_121; 
x_121 = !lean_is_exclusive(x_119);
if (x_121 == 0)
{
lean_object* x_122; 
x_122 = lean_ctor_get(x_119, 0);
if (lean_obj_tag(x_122) == 3)
{
lean_ctor_set(x_119, 0, x_117);
return x_119;
}
else
{
lean_object* x_123; 
lean_free_object(x_119);
lean_dec(x_122);
lean_dec(x_117);
x_123 = lean_box(0);
return x_123;
}
}
else
{
lean_object* x_124; 
x_124 = lean_ctor_get(x_119, 0);
lean_inc(x_124);
lean_dec(x_119);
if (lean_obj_tag(x_124) == 3)
{
lean_object* x_125; 
x_125 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_125, 0, x_117);
return x_125;
}
else
{
lean_object* x_126; 
lean_dec(x_124);
lean_dec(x_117);
x_126 = lean_box(0);
return x_126;
}
}
}
}
}
}
}
static lean_object* _init_l_Fcomp_STLC_apply__id__to__true___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("x", 1);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_apply__id__to__true___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_apply__id__to__true___closed__1;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_apply__id__to__true___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_apply__id__to__true___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_apply__id__to__true___closed__2;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_apply__id__to__true___closed__4() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("true", 4);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_apply__id__to__true___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_apply__id__to__true___closed__4;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_apply__id__to__true___closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_apply__id__to__true___closed__3;
x_2 = l_Fcomp_STLC_apply__id__to__true___closed__5;
x_3 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_apply__id__to__true() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_apply__id__to__true___closed__6;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Fcomp_Types(uint8_t builtin, lean_object*);
lean_object* initialize_Fcomp_Terms(uint8_t builtin, lean_object*);
lean_object* initialize_Fcomp_Context(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Fcomp_TypeChecker(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Fcomp_Types(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Fcomp_Terms(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Fcomp_Context(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_Fcomp_STLC_instBEqTy__1___closed__1 = _init_l_Fcomp_STLC_instBEqTy__1___closed__1();
lean_mark_persistent(l_Fcomp_STLC_instBEqTy__1___closed__1);
l_Fcomp_STLC_instBEqTy__1 = _init_l_Fcomp_STLC_instBEqTy__1();
lean_mark_persistent(l_Fcomp_STLC_instBEqTy__1);
l_Fcomp_STLC_term___u22a2___x3a_____closed__1 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__1();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__1);
l_Fcomp_STLC_term___u22a2___x3a_____closed__2 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__2();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__2);
l_Fcomp_STLC_term___u22a2___x3a_____closed__3 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__3();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__3);
l_Fcomp_STLC_term___u22a2___x3a_____closed__4 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__4();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__4);
l_Fcomp_STLC_term___u22a2___x3a_____closed__5 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__5();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__5);
l_Fcomp_STLC_term___u22a2___x3a_____closed__6 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__6();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__6);
l_Fcomp_STLC_term___u22a2___x3a_____closed__7 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__7();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__7);
l_Fcomp_STLC_term___u22a2___x3a_____closed__8 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__8();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__8);
l_Fcomp_STLC_term___u22a2___x3a_____closed__9 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__9();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__9);
l_Fcomp_STLC_term___u22a2___x3a_____closed__10 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__10();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__10);
l_Fcomp_STLC_term___u22a2___x3a_____closed__11 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__11();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__11);
l_Fcomp_STLC_term___u22a2___x3a_____closed__12 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__12();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__12);
l_Fcomp_STLC_term___u22a2___x3a_____closed__13 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__13();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__13);
l_Fcomp_STLC_term___u22a2___x3a_____closed__14 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__14();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__14);
l_Fcomp_STLC_term___u22a2___x3a_____closed__15 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__15();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__15);
l_Fcomp_STLC_term___u22a2___x3a_____closed__16 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__16();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__16);
l_Fcomp_STLC_term___u22a2___x3a_____closed__17 = _init_l_Fcomp_STLC_term___u22a2___x3a_____closed__17();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a_____closed__17);
l_Fcomp_STLC_term___u22a2___x3a__ = _init_l_Fcomp_STLC_term___u22a2___x3a__();
lean_mark_persistent(l_Fcomp_STLC_term___u22a2___x3a__);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__1 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__1();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__1);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__2 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__2();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__2);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__3 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__3();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__3);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__4 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__4();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__4);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__5 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__5();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__5);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__6 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__6();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__6);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__7 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__7();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__7);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__8 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__8();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__8);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__9 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__9();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__9);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__10 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__10();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__10);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__11 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__11();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__11);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__12 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__12();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__12);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__13 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__13();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__13);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__14 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__14();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__14);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__15 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__15();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__15);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__16 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__16();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______macroRules__Fcomp__STLC__term___u22a2___x3a____1___closed__16);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__1 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__1();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__1);
l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__2 = _init_l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__2();
lean_mark_persistent(l_Fcomp_STLC___aux__Fcomp__TypeChecker______unexpand__Fcomp__STLC__HasType__1___closed__2);
l_Fcomp_STLC_typeOf___closed__1 = _init_l_Fcomp_STLC_typeOf___closed__1();
lean_mark_persistent(l_Fcomp_STLC_typeOf___closed__1);
l_Fcomp_STLC_apply__id__to__true___closed__1 = _init_l_Fcomp_STLC_apply__id__to__true___closed__1();
lean_mark_persistent(l_Fcomp_STLC_apply__id__to__true___closed__1);
l_Fcomp_STLC_apply__id__to__true___closed__2 = _init_l_Fcomp_STLC_apply__id__to__true___closed__2();
lean_mark_persistent(l_Fcomp_STLC_apply__id__to__true___closed__2);
l_Fcomp_STLC_apply__id__to__true___closed__3 = _init_l_Fcomp_STLC_apply__id__to__true___closed__3();
lean_mark_persistent(l_Fcomp_STLC_apply__id__to__true___closed__3);
l_Fcomp_STLC_apply__id__to__true___closed__4 = _init_l_Fcomp_STLC_apply__id__to__true___closed__4();
lean_mark_persistent(l_Fcomp_STLC_apply__id__to__true___closed__4);
l_Fcomp_STLC_apply__id__to__true___closed__5 = _init_l_Fcomp_STLC_apply__id__to__true___closed__5();
lean_mark_persistent(l_Fcomp_STLC_apply__id__to__true___closed__5);
l_Fcomp_STLC_apply__id__to__true___closed__6 = _init_l_Fcomp_STLC_apply__id__to__true___closed__6();
lean_mark_persistent(l_Fcomp_STLC_apply__id__to__true___closed__6);
l_Fcomp_STLC_apply__id__to__true = _init_l_Fcomp_STLC_apply__id__to__true();
lean_mark_persistent(l_Fcomp_STLC_apply__id__to__true);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
