// Lean compiler output
// Module: Fcomp.LambdaExamples
// Imports: Init Fcomp.Types Fcomp.Terms Fcomp.Context Fcomp.TypeChecker Fcomp.Substitution
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
static lean_object* l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__2;
static lean_object* l_Fcomp_STLC_Examples_churchPair___closed__4;
extern lean_object* l_Fcomp_STLC_natTy;
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__6;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_appExample;
static lean_object* l_Fcomp_STLC_Examples_idBool___closed__1;
static lean_object* l_Fcomp_STLC_Examples_idBool_x27___closed__1;
static lean_object* l_Fcomp_STLC_Examples_churchTrue___closed__1;
lean_object* l_Fcomp_STLC_Term_substSimple(lean_object*, lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__9;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_idNat;
static lean_object* l_Fcomp_STLC_Examples_appExample___closed__1;
static lean_object* l_Fcomp_STLC_Examples_appExample___closed__2;
static lean_object* l_Fcomp_STLC_Examples_churchSnd___closed__2;
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__10;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_churchFalse;
static lean_object* l_Fcomp_STLC_Examples_churchFst___closed__4;
static lean_object* l_Fcomp_STLC_Examples_churchPair___closed__1;
static lean_object* l_Fcomp_STLC_Examples_idNat___closed__1;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_churchFst;
static lean_object* l_Fcomp_STLC_Examples_idBoolApp___closed__3;
static lean_object* l_Fcomp_STLC_Examples_churchFst___closed__5;
lean_object* l_Fcomp_STLC_Term_subst(lean_object*, lean_object*, lean_object*);
static lean_object* l_Fcomp_STLC_Examples_churchPair___closed__2;
static lean_object* l_Fcomp_STLC_Examples_potential__capture___closed__1;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_churchIf;
static lean_object* l_Fcomp_STLC_Examples_churchFst___closed__1;
static lean_object* l_Fcomp_STLC_Examples_capture__avoided___closed__1;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_abstractionWithFreeVar;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_idBool;
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__8;
static lean_object* l_Fcomp_STLC_Examples_churchFst___closed__2;
static lean_object* l_Fcomp_STLC_Examples_appSubst___closed__1;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_churchPair;
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__7;
static lean_object* l_Fcomp_STLC_Examples_abstractionSubst___closed__3;
extern lean_object* l_Fcomp_STLC_boolTy;
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__3;
static lean_object* l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__1;
static lean_object* l_Fcomp_STLC_Examples_churchFalse___closed__1;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_idBool_x27;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_idBoolApp;
static lean_object* l_Fcomp_STLC_Examples_const___closed__3;
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__4;
static lean_object* l_Fcomp_STLC_Examples_idBoolApp___closed__1;
static lean_object* l_Fcomp_STLC_Examples_churchPair___closed__3;
static lean_object* l_Fcomp_STLC_Examples_abstractionSubst___closed__2;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_churchTrue;
static lean_object* l_Fcomp_STLC_Examples_abstractionSubst___closed__1;
static lean_object* l_Fcomp_STLC_Examples_churchFalse___closed__2;
static lean_object* l_Fcomp_STLC_Examples_const___closed__1;
static lean_object* l_Fcomp_STLC_Examples_idBool___closed__2;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_const;
static lean_object* l_Fcomp_STLC_Examples_appSubst___closed__2;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_capture__avoided;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_churchSnd;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_abstractionSubst;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_potential__capture;
static lean_object* l_Fcomp_STLC_Examples_appExample___closed__3;
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__2;
static lean_object* l_Fcomp_STLC_Examples_idBoolApp___closed__2;
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__1;
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__11;
static lean_object* l_Fcomp_STLC_Examples_churchIf___closed__5;
static lean_object* l_Fcomp_STLC_Examples_idBool___closed__3;
static lean_object* l_Fcomp_STLC_Examples_const___closed__2;
LEAN_EXPORT lean_object* l_Fcomp_STLC_Examples_appSubst;
static lean_object* l_Fcomp_STLC_Examples_churchSnd___closed__1;
static lean_object* l_Fcomp_STLC_Examples_churchFst___closed__3;
static lean_object* _init_l_Fcomp_STLC_Examples_idBool___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("x", 1);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idBool___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_Examples_idBool___closed__1;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idBool___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_idBool___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_idBool___closed__2;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idBool() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_idBool___closed__3;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idNat___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_idBool___closed__1;
x_2 = l_Fcomp_STLC_natTy;
x_3 = l_Fcomp_STLC_Examples_idBool___closed__2;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idNat() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_idNat___closed__1;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_const___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("y", 1);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_const___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_const___closed__1;
x_2 = l_Fcomp_STLC_natTy;
x_3 = l_Fcomp_STLC_Examples_idBool___closed__2;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_const___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_idBool___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_const___closed__2;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_const() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_const___closed__3;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idBoolApp___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("true", 4);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idBoolApp___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_Examples_idBoolApp___closed__1;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idBoolApp___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_Examples_idBool;
x_2 = l_Fcomp_STLC_Examples_idBoolApp___closed__2;
x_3 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idBoolApp() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_idBoolApp___closed__3;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_appExample___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("f", 1);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_appExample___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_Examples_appExample___closed__1;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_appExample___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_Examples_appExample___closed__2;
x_2 = l_Fcomp_STLC_Examples_idBool___closed__2;
x_3 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_appExample() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_appExample___closed__3;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_appSubst___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_Examples_const___closed__1;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_appSubst___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_appExample;
x_2 = l_Fcomp_STLC_Examples_idBool___closed__1;
x_3 = l_Fcomp_STLC_Examples_appSubst___closed__1;
x_4 = l_Fcomp_STLC_Term_substSimple(x_1, x_2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_appSubst() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_appSubst___closed__2;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_Examples_idBool___closed__2;
x_2 = l_Fcomp_STLC_Examples_appSubst___closed__1;
x_3 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_idBool___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__1;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_abstractionWithFreeVar() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__2;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_abstractionSubst___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("z", 1);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_abstractionSubst___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_Examples_abstractionSubst___closed__1;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_abstractionSubst___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_abstractionWithFreeVar;
x_2 = l_Fcomp_STLC_Examples_const___closed__1;
x_3 = l_Fcomp_STLC_Examples_abstractionSubst___closed__2;
x_4 = l_Fcomp_STLC_Term_subst(x_1, x_2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_abstractionSubst() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_abstractionSubst___closed__3;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_potential__capture___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_const___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_idBool___closed__2;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_potential__capture() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_potential__capture___closed__1;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_capture__avoided___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_potential__capture;
x_2 = l_Fcomp_STLC_Examples_idBool___closed__1;
x_3 = l_Fcomp_STLC_Examples_appSubst___closed__1;
x_4 = l_Fcomp_STLC_Term_subst(x_1, x_2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_capture__avoided() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_capture__avoided___closed__1;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idBool_x27___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_abstractionSubst___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_abstractionSubst___closed__2;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_idBool_x27() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_idBool_x27___closed__1;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchTrue___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_idBool___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_potential__capture___closed__1;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchTrue() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_churchTrue___closed__1;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchFalse___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_const___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_appSubst___closed__1;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchFalse___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_idBool___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_churchFalse___closed__1;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchFalse() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_churchFalse___closed__2;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_boolTy;
x_2 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_2, 0, x_1);
lean_ctor_set(x_2, 1, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_boolTy;
x_2 = l_Fcomp_STLC_Examples_churchIf___closed__1;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__3() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("b", 1);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_Examples_churchIf___closed__3;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__5() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("t", 1);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_Examples_churchIf___closed__5;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_Examples_churchIf___closed__4;
x_2 = l_Fcomp_STLC_Examples_churchIf___closed__6;
x_3 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_Examples_churchIf___closed__7;
x_2 = l_Fcomp_STLC_Examples_appExample___closed__2;
x_3 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_appExample___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_churchIf___closed__8;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_churchIf___closed__5;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_churchIf___closed__9;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf___closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_churchIf___closed__3;
x_2 = l_Fcomp_STLC_Examples_churchIf___closed__2;
x_3 = l_Fcomp_STLC_Examples_churchIf___closed__10;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchIf() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_churchIf___closed__11;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchPair___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_Examples_appExample___closed__3;
x_2 = l_Fcomp_STLC_Examples_appSubst___closed__1;
x_3 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchPair___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_appExample___closed__1;
x_2 = l_Fcomp_STLC_Examples_churchIf___closed__2;
x_3 = l_Fcomp_STLC_Examples_churchPair___closed__1;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchPair___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_const___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_churchPair___closed__2;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchPair___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_idBool___closed__1;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = l_Fcomp_STLC_Examples_churchPair___closed__3;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchPair() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_churchPair___closed__4;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchFst___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_Examples_churchIf___closed__2;
x_2 = l_Fcomp_STLC_boolTy;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchFst___closed__2() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("p", 1);
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchFst___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_Fcomp_STLC_Examples_churchFst___closed__2;
x_2 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchFst___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_Examples_churchFst___closed__3;
x_2 = l_Fcomp_STLC_Examples_churchTrue;
x_3 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchFst___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_churchFst___closed__2;
x_2 = l_Fcomp_STLC_Examples_churchFst___closed__1;
x_3 = l_Fcomp_STLC_Examples_churchFst___closed__4;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchFst() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_churchFst___closed__5;
return x_1;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchSnd___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_Fcomp_STLC_Examples_churchFst___closed__3;
x_2 = l_Fcomp_STLC_Examples_churchFalse;
x_3 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchSnd___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_Fcomp_STLC_Examples_churchFst___closed__2;
x_2 = l_Fcomp_STLC_Examples_churchFst___closed__1;
x_3 = l_Fcomp_STLC_Examples_churchSnd___closed__1;
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_Fcomp_STLC_Examples_churchSnd() {
_start:
{
lean_object* x_1; 
x_1 = l_Fcomp_STLC_Examples_churchSnd___closed__2;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Fcomp_Types(uint8_t builtin, lean_object*);
lean_object* initialize_Fcomp_Terms(uint8_t builtin, lean_object*);
lean_object* initialize_Fcomp_Context(uint8_t builtin, lean_object*);
lean_object* initialize_Fcomp_TypeChecker(uint8_t builtin, lean_object*);
lean_object* initialize_Fcomp_Substitution(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Fcomp_LambdaExamples(uint8_t builtin, lean_object* w) {
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
res = initialize_Fcomp_TypeChecker(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Fcomp_Substitution(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_Fcomp_STLC_Examples_idBool___closed__1 = _init_l_Fcomp_STLC_Examples_idBool___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_idBool___closed__1);
l_Fcomp_STLC_Examples_idBool___closed__2 = _init_l_Fcomp_STLC_Examples_idBool___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_idBool___closed__2);
l_Fcomp_STLC_Examples_idBool___closed__3 = _init_l_Fcomp_STLC_Examples_idBool___closed__3();
lean_mark_persistent(l_Fcomp_STLC_Examples_idBool___closed__3);
l_Fcomp_STLC_Examples_idBool = _init_l_Fcomp_STLC_Examples_idBool();
lean_mark_persistent(l_Fcomp_STLC_Examples_idBool);
l_Fcomp_STLC_Examples_idNat___closed__1 = _init_l_Fcomp_STLC_Examples_idNat___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_idNat___closed__1);
l_Fcomp_STLC_Examples_idNat = _init_l_Fcomp_STLC_Examples_idNat();
lean_mark_persistent(l_Fcomp_STLC_Examples_idNat);
l_Fcomp_STLC_Examples_const___closed__1 = _init_l_Fcomp_STLC_Examples_const___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_const___closed__1);
l_Fcomp_STLC_Examples_const___closed__2 = _init_l_Fcomp_STLC_Examples_const___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_const___closed__2);
l_Fcomp_STLC_Examples_const___closed__3 = _init_l_Fcomp_STLC_Examples_const___closed__3();
lean_mark_persistent(l_Fcomp_STLC_Examples_const___closed__3);
l_Fcomp_STLC_Examples_const = _init_l_Fcomp_STLC_Examples_const();
lean_mark_persistent(l_Fcomp_STLC_Examples_const);
l_Fcomp_STLC_Examples_idBoolApp___closed__1 = _init_l_Fcomp_STLC_Examples_idBoolApp___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_idBoolApp___closed__1);
l_Fcomp_STLC_Examples_idBoolApp___closed__2 = _init_l_Fcomp_STLC_Examples_idBoolApp___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_idBoolApp___closed__2);
l_Fcomp_STLC_Examples_idBoolApp___closed__3 = _init_l_Fcomp_STLC_Examples_idBoolApp___closed__3();
lean_mark_persistent(l_Fcomp_STLC_Examples_idBoolApp___closed__3);
l_Fcomp_STLC_Examples_idBoolApp = _init_l_Fcomp_STLC_Examples_idBoolApp();
lean_mark_persistent(l_Fcomp_STLC_Examples_idBoolApp);
l_Fcomp_STLC_Examples_appExample___closed__1 = _init_l_Fcomp_STLC_Examples_appExample___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_appExample___closed__1);
l_Fcomp_STLC_Examples_appExample___closed__2 = _init_l_Fcomp_STLC_Examples_appExample___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_appExample___closed__2);
l_Fcomp_STLC_Examples_appExample___closed__3 = _init_l_Fcomp_STLC_Examples_appExample___closed__3();
lean_mark_persistent(l_Fcomp_STLC_Examples_appExample___closed__3);
l_Fcomp_STLC_Examples_appExample = _init_l_Fcomp_STLC_Examples_appExample();
lean_mark_persistent(l_Fcomp_STLC_Examples_appExample);
l_Fcomp_STLC_Examples_appSubst___closed__1 = _init_l_Fcomp_STLC_Examples_appSubst___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_appSubst___closed__1);
l_Fcomp_STLC_Examples_appSubst___closed__2 = _init_l_Fcomp_STLC_Examples_appSubst___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_appSubst___closed__2);
l_Fcomp_STLC_Examples_appSubst = _init_l_Fcomp_STLC_Examples_appSubst();
lean_mark_persistent(l_Fcomp_STLC_Examples_appSubst);
l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__1 = _init_l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__1);
l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__2 = _init_l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_abstractionWithFreeVar___closed__2);
l_Fcomp_STLC_Examples_abstractionWithFreeVar = _init_l_Fcomp_STLC_Examples_abstractionWithFreeVar();
lean_mark_persistent(l_Fcomp_STLC_Examples_abstractionWithFreeVar);
l_Fcomp_STLC_Examples_abstractionSubst___closed__1 = _init_l_Fcomp_STLC_Examples_abstractionSubst___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_abstractionSubst___closed__1);
l_Fcomp_STLC_Examples_abstractionSubst___closed__2 = _init_l_Fcomp_STLC_Examples_abstractionSubst___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_abstractionSubst___closed__2);
l_Fcomp_STLC_Examples_abstractionSubst___closed__3 = _init_l_Fcomp_STLC_Examples_abstractionSubst___closed__3();
lean_mark_persistent(l_Fcomp_STLC_Examples_abstractionSubst___closed__3);
l_Fcomp_STLC_Examples_abstractionSubst = _init_l_Fcomp_STLC_Examples_abstractionSubst();
lean_mark_persistent(l_Fcomp_STLC_Examples_abstractionSubst);
l_Fcomp_STLC_Examples_potential__capture___closed__1 = _init_l_Fcomp_STLC_Examples_potential__capture___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_potential__capture___closed__1);
l_Fcomp_STLC_Examples_potential__capture = _init_l_Fcomp_STLC_Examples_potential__capture();
lean_mark_persistent(l_Fcomp_STLC_Examples_potential__capture);
l_Fcomp_STLC_Examples_capture__avoided___closed__1 = _init_l_Fcomp_STLC_Examples_capture__avoided___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_capture__avoided___closed__1);
l_Fcomp_STLC_Examples_capture__avoided = _init_l_Fcomp_STLC_Examples_capture__avoided();
lean_mark_persistent(l_Fcomp_STLC_Examples_capture__avoided);
l_Fcomp_STLC_Examples_idBool_x27___closed__1 = _init_l_Fcomp_STLC_Examples_idBool_x27___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_idBool_x27___closed__1);
l_Fcomp_STLC_Examples_idBool_x27 = _init_l_Fcomp_STLC_Examples_idBool_x27();
lean_mark_persistent(l_Fcomp_STLC_Examples_idBool_x27);
l_Fcomp_STLC_Examples_churchTrue___closed__1 = _init_l_Fcomp_STLC_Examples_churchTrue___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchTrue___closed__1);
l_Fcomp_STLC_Examples_churchTrue = _init_l_Fcomp_STLC_Examples_churchTrue();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchTrue);
l_Fcomp_STLC_Examples_churchFalse___closed__1 = _init_l_Fcomp_STLC_Examples_churchFalse___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchFalse___closed__1);
l_Fcomp_STLC_Examples_churchFalse___closed__2 = _init_l_Fcomp_STLC_Examples_churchFalse___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchFalse___closed__2);
l_Fcomp_STLC_Examples_churchFalse = _init_l_Fcomp_STLC_Examples_churchFalse();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchFalse);
l_Fcomp_STLC_Examples_churchIf___closed__1 = _init_l_Fcomp_STLC_Examples_churchIf___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__1);
l_Fcomp_STLC_Examples_churchIf___closed__2 = _init_l_Fcomp_STLC_Examples_churchIf___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__2);
l_Fcomp_STLC_Examples_churchIf___closed__3 = _init_l_Fcomp_STLC_Examples_churchIf___closed__3();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__3);
l_Fcomp_STLC_Examples_churchIf___closed__4 = _init_l_Fcomp_STLC_Examples_churchIf___closed__4();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__4);
l_Fcomp_STLC_Examples_churchIf___closed__5 = _init_l_Fcomp_STLC_Examples_churchIf___closed__5();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__5);
l_Fcomp_STLC_Examples_churchIf___closed__6 = _init_l_Fcomp_STLC_Examples_churchIf___closed__6();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__6);
l_Fcomp_STLC_Examples_churchIf___closed__7 = _init_l_Fcomp_STLC_Examples_churchIf___closed__7();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__7);
l_Fcomp_STLC_Examples_churchIf___closed__8 = _init_l_Fcomp_STLC_Examples_churchIf___closed__8();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__8);
l_Fcomp_STLC_Examples_churchIf___closed__9 = _init_l_Fcomp_STLC_Examples_churchIf___closed__9();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__9);
l_Fcomp_STLC_Examples_churchIf___closed__10 = _init_l_Fcomp_STLC_Examples_churchIf___closed__10();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__10);
l_Fcomp_STLC_Examples_churchIf___closed__11 = _init_l_Fcomp_STLC_Examples_churchIf___closed__11();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf___closed__11);
l_Fcomp_STLC_Examples_churchIf = _init_l_Fcomp_STLC_Examples_churchIf();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchIf);
l_Fcomp_STLC_Examples_churchPair___closed__1 = _init_l_Fcomp_STLC_Examples_churchPair___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchPair___closed__1);
l_Fcomp_STLC_Examples_churchPair___closed__2 = _init_l_Fcomp_STLC_Examples_churchPair___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchPair___closed__2);
l_Fcomp_STLC_Examples_churchPair___closed__3 = _init_l_Fcomp_STLC_Examples_churchPair___closed__3();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchPair___closed__3);
l_Fcomp_STLC_Examples_churchPair___closed__4 = _init_l_Fcomp_STLC_Examples_churchPair___closed__4();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchPair___closed__4);
l_Fcomp_STLC_Examples_churchPair = _init_l_Fcomp_STLC_Examples_churchPair();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchPair);
l_Fcomp_STLC_Examples_churchFst___closed__1 = _init_l_Fcomp_STLC_Examples_churchFst___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchFst___closed__1);
l_Fcomp_STLC_Examples_churchFst___closed__2 = _init_l_Fcomp_STLC_Examples_churchFst___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchFst___closed__2);
l_Fcomp_STLC_Examples_churchFst___closed__3 = _init_l_Fcomp_STLC_Examples_churchFst___closed__3();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchFst___closed__3);
l_Fcomp_STLC_Examples_churchFst___closed__4 = _init_l_Fcomp_STLC_Examples_churchFst___closed__4();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchFst___closed__4);
l_Fcomp_STLC_Examples_churchFst___closed__5 = _init_l_Fcomp_STLC_Examples_churchFst___closed__5();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchFst___closed__5);
l_Fcomp_STLC_Examples_churchFst = _init_l_Fcomp_STLC_Examples_churchFst();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchFst);
l_Fcomp_STLC_Examples_churchSnd___closed__1 = _init_l_Fcomp_STLC_Examples_churchSnd___closed__1();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchSnd___closed__1);
l_Fcomp_STLC_Examples_churchSnd___closed__2 = _init_l_Fcomp_STLC_Examples_churchSnd___closed__2();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchSnd___closed__2);
l_Fcomp_STLC_Examples_churchSnd = _init_l_Fcomp_STLC_Examples_churchSnd();
lean_mark_persistent(l_Fcomp_STLC_Examples_churchSnd);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
